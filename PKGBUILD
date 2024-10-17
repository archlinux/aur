# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Evan Bush (PencilShavings) <eb.pencilshavings@protonmail.com>

pkgname=quickemu-git
pkgver=4.9.6.r35.g84595dc
pkgrel=1
pkgdesc="Quickly create and run optimised Windows, macOS and Linux desktop virtual machines"
arch=(any)
url="https://github.com/quickemu-project/quickemu"
license=(MIT)
depends=(qemu-desktop jq python3 cdrtools usbutils spice-gtk swtpm xorg-xrandr zsync edk2-ovmf)
makedepends=(git)
optdepends=('quickgui: graphical user interface')
provides=(quickemu)
conflicts=(quickemu)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "quickemu"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "quickemu"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd docs
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
