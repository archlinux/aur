# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=iphonebackuptools
# work around until upstream versions
# https://github.com/richinfante/iphonebackuptools/issues/68
pkgver=4.0.0
pkgrel=1
pkgdesc="Extract messages, notes, photo locations and more from unencrypted iOS backups"
arch=('any')
url="https://github.com/richinfante/iphonebackuptools"
license=(MIT)
depends=(nodejs sqlite)
makedepends=(npm python)
source=(https://github.com/richinfante/iphonebackuptools/archive/"$pkgver.tar.gz")
noextract=("$_commit.tar.gz")
sha256sums=('93e5edbd66d483a9ebbbd7c41d627e26c68803e915d0e9234c5bbbb01e2f1771')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir/$pkgver.tar.gz"
  
  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "$pkgdir"
}
