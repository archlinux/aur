# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=lxqt_wallet
pkgname=$_pkgname-git
pkgver=3.1.0.r17.g33e1610
pkgrel=1
pkgdesc="Secure storage of information for lxqt"
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=("libgcrypt")
optdepends=("kwallet: store passwords in kwallet"
            "libsecret: store passwords in GNOME's secret service")
makedepends=("cmake" "qt5-base" "kwallet" "libsecret" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    "$srcdir/$_pkgname"

  make
}

package() {
  cd build

  make DESTDIR="$pkgdir" install
}
