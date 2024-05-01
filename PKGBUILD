# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Evan Bush (PencilShavings) <eb.pencilshavings@protonmail.com>

pkgname=quickemu-git
pkgver=4.9.2.r468.gfaee282
pkgrel=2
pkgdesc="Quickly create and run optimised Windows, macOS and Linux desktop virtual machines"
arch=(any)
url="https://github.com/quickemu-project/quickemu"
license=(MIT)
depends=(qemu jq python3 cdrtools usbutils spice-gtk swtpm wget xorg-xrandr zsync edk2-ovmf)
makedepends=(git)
optdepends=('quickgui: graphical user interface'
            'aria2: faster downloads')
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
  install -Dm755 quickemu   -t "${pkgdir}/usr/bin"
  install -Dm755 quickget   -t "${pkgdir}/usr/bin"
  install -Dm755 chunkcheck -t "${pkgdir}/usr/bin"
  install -Dm755 windowskey -t "${pkgdir}/usr/bin"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd docs
  install -Dm644 quickget.1      -t ${pkgdir}/usr/share/man/man1
  install -Dm644 quickemu.1      -t ${pkgdir}/usr/share/man/man1
  install -Dm644 quickemu_conf.1 -t ${pkgdir}/usr/share/man/man1
}
