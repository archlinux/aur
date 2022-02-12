# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
set -xe
source ".env"
set +e

pkgname="labtunnel-git"
set +x

pkgver=r207.09a1b34
pkgrel=1
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=()
depends=("openssh" "systemd")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=labtunnel.install
changelog=
source=("${pkgname%-git}::git+https://github.com/renxida/${pkgname%-git}.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}




_SYSTEMD_SERVICE_DIR="/etc/systemd/user"


noextract=()

prepare() {
  set -x
  cd "$srcdir"
  set +x
}

package() {
  set -x
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 "labtunnel@.service" "${pkgdir}${_SYSTEMD_SERVICE_DIR}/labtunnel@.service"
  set +x
}

# vim:set ts=2 sw=2 et:
