# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Evan Bush (PencilShavings) <eb.pencilshavings@protonmail.com>

pkgname=quickemu-git
pkgver=4.5.r1.gc3d21b9
pkgrel=1
pkgdesc='Quickly create and run optimised Windows, macOS and Linux desktop virtual machines'
arch=('any')
url="https://github.com/${pkgname%-git}-project/${pkgname%-git}"
license=('MIT')
depends=('qemu' 'jq' 'python3' 'cdrtools' 'usbutils' 'spice-gtk' 'swtpm' 'wget' 'xorg-xrandr' 'zsync' 'edk2-ovmf')
makedepends=('git')
optdepends=('quickgui: graphical user interface' 'aria2: faster downloads')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+$url")
b2sums=('SKIP')

pkgver()
{
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
  cd ${pkgname%-git}
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
  install -Dm755 ${pkgname%-git} -t "$pkgdir"/usr/bin
  install -Dm755 quickget -t "$pkgdir"/usr/bin
  install -Dm755 macrecovery -t "$pkgdir"/usr/bin/macrecovery

  cd docs
  install -Dm644 quickget.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm644 ${pkgname%-git}.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm644 ${pkgname%-git}_conf.1 -t "$pkgdir"/usr/share/man/man1
}
