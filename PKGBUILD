pkgname=soprano-tenor-git
_pkgname=Soprano
pkgver=r14.de19c75
pkgrel=1
pkgdesc="A privacy-respecting frontend to Tenor"
arch=(any)
url=https://git.vern.cc/cobra/Soprano
license=('AGPL-3.0-or-later')
install=soprano.install
depends=('guile' 'guile-gnutls' 'guile-lib')
makedepends=('git')
source=('git+https://git.vern.cc/cobra/Soprano.git' 'soprano.service' )
sha256sums=('SKIP' 'SKIP' )

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install_path="$pkgdir/usr/share/webapps/soprano"
  cd $_pkgname
  install -dm755 $install_path
  cp -r ./* "$install_path/"
  install -d "$pkgdir/usr/lib/systemd/system"
  install -m644 "$srcdir/soprano.service" "$pkgdir/usr/lib/systemd/system/soprano.service"
}
