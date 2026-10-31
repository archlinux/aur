# Maintainer: lunainvictum (solisinvictum on GitHub) https://github.com/solisinvictum/vidoas
pkgbase=vidoas
pkgname=('vidoas' 'vidoas-visudo')
pkgver=1.2.0
pkgrel=1
pkgdesc="Safely edit the doas.conf file (like visudo for doas)"
arch=('any')
url="https://github.com/solisinvictum/vidoas"
license=('GPL-3.0-only')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93013feb77c43a075365cbe2fb6d5920a995106630417c0fe34f171873cd1c03')

package_vidoas() {
  depends=('bash' 'opendoas' 'util-linux')

  cd "$pkgbase-$pkgver"
  install -Dm755 vidoas "$pkgdir/usr/bin/vidoas"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_vidoas-visudo() {
  pkgdesc="A visudo symlink for using vidoas as a drop-in replacement (for systems without sudo)"
  depends=('vidoas')
  # The real sudo ships its own /usr/bin/visudo. Versioned on purpose: an
  # unversioned conflict would also hit sudo replacements that only
  # 'provide' sudo without a version (opendoas-sudo, doas-sudo-shim).
  conflicts=('sudo>=1')

  install -d "$pkgdir/usr/bin"
  ln -s vidoas "$pkgdir/usr/bin/visudo"
}
