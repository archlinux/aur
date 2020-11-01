# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=kdepim-runtime-etesync-git
_pkgname=kdepim-runtime-etesync
pkgver=v20.08.1.r196.ga0a134809
pkgrel=1
pkgdesc='Extends the functionality of kdepim (with etesync modules)'
arch=(x86_64)
url='https://kontact.kde.org'
license=(GPL LGPL FDL)
depends=(libkolabxml kdav akonadi-calendar knotifyconfig kalarmcal kmbox pimcommon akonadi-notes akonadi libakonadi qca qt5-networkauth etebase)
makedepends=(extra-cmake-modules kdoctools boost git)
provides=(kdepim-runtime)
conflicts=(kdepim-runtime)
source=("${_pkgname}::git+https://invent.kde.org/pim/kdepim-runtime"
        "0001-XXX-Ease-version-requirements.patch")
sha512sums=('SKIP'
        'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
    git apply ../0001-XXX-Ease-version-requirements.patch
}

build() {
  cmake -B build -S "${_pkgname}" \
        -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
