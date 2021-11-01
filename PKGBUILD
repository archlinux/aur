# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>
# Contributor: Static_Rocket

pkgname=asusctl
pkgver=4.0.6
pkgrel=1
pkgdesc="Asus hardware control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL2')
depends=('libusb' 'systemd' 'power-profiles-daemon')
optdepends=('acpi_call: fan control')
makedepends=('git' 'rust')
conflicts=('asusctl-git')
_commit=38d047cb8a4c6342dde6b78ff78302ebf8236a7b # tags/4.0.6^0
source=("git+${url}.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${pkgname}"
  make build
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
