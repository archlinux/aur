# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=sugar-runner-git
pkgver=v0.110.0.2.g6eebec3
pkgrel=1
pkgdesc="Scripts to run Sugar"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('GPL')
depends=('sugar-git' 'xorg-xinit' 'xorg-server-xephyr' 'xorg-xrandr')
makedepends=('gobject-introspection')
source=("git+https://github.com/sugarlabs/sugar-runner.git"
        0001-Python-3-port.patch)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "$srcdir/${pkgname%-git}"

  # https://github.com/sugarlabs/sugar-runner/pull/5
  patch -Np1 -i ../0001-Python-3-port.patch

  # Fix launch from the application menu
  echo 'Terminal=true' >>data/sugar-runner.desktop
}


build() {
  cd "$srcdir/${pkgname%-git}"
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr --with-python3
  make
}


package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
