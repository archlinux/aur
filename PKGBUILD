# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=kdepim-runtime-etesync-git
_pkgname=kdepim-runtime-etesync
pkgver=v20.04.1.r205.g166ef579c
pkgrel=1
pkgdesc='Extends the functionality of kdepim (with etesync modules)'
arch=(x86_64)
url='https://kontact.kde.org'
license=(GPL LGPL FDL)
depends=(libkolabxml kdav akonadi-calendar knotifyconfig kalarmcal kmbox pimcommon akonadi-notes akonadi libakonadi qca qt5-networkauth etesync-git)
makedepends=(extra-cmake-modules kdoctools boost git)
provides=(kdepim-runtime)
conflicts=(kdepim-runtime)
source=("${_pkgname}::git+https://invent.kde.org/sjolly/kdepim-runtime.git#branch=etesyncResource"
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
