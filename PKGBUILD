pkgname=kwinft
pkgver=5.23.1
_pkgver=5.23.1
pkgrel=1
pkgdesc='Wayland compositor and X11 window manager'
arch=(x86_64)
url="https://gitlab.com/kwinft/kwinft"
license=(LGPL)
depends=(xcb-util-cursor plasma-framework kcmutils breeze kinit qt5-sensors qt5-script wrapland disman kdisplay kidletime kscreenlocker kdecoration">=${pkgver}" libqaccessibilityclient python wlroots)
makedepends=(extra-cmake-modules qt5-tools kdoctools wrapland)
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland')
provides=("kwin=${pkgver}")
conflicts=("kwin")
source=("https://gitlab.com/kwinft/kwinft/-/archive/kwinft@$_pkgver/kwinft-kwinft@$_pkgver.tar.gz")
md5sums=('397c68397fc441dc8518927f58179ca8')
install=kwinft.install

prepare() {
  tar -xvf kwinft-kwinft@$_pkgver.tar.gz
  mkdir -p "$srcdir"/build/make
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir/kwinft-kwinft@$_pkgver" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}


package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
