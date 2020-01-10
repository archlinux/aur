# Previous maintainer: Davide Depau <davide@depau.eu>
# Maintainer: Antoine Damhet <xdbob@lse.epita.fr>

_pkgname=brightnessctl
pkgname=${_pkgname}-sd-git
pkgver=0.4.r13.g5a53dc0
pkgrel=2
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
makedepends=('git' 'pkg-config')
depends=('systemd-libs>=243')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/Hummer12007/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr ENABLE_SYSTEMD=1
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" MODE=0755 INSTALL_UDEV_RULES=0 install
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

