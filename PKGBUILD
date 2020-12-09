# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=kdepim-runtime-etesync-git
_pkgname=kdepim-runtime-etesync
pkgver=v20.11.90.r31.g3c8387b68
pkgrel=1
pkgdesc='Extends the functionality of kdepim (with etesync modules)'
arch=(x86_64)
url='https://kontact.kde.org'
license=(GPL LGPL FDL)
depends=(libkolabxml kdav akonadi-calendar knotifyconfig kalarmcal kmbox pimcommon akonadi-notes akonadi qca qt5-networkauth kdepim-runtime libetebase)
makedepends=(extra-cmake-modules kdoctools boost git)
source=("${_pkgname}::git+https://invent.kde.org/pim/kdepim-runtime?branch=release/20.12"
        "0001-XXX-Ease-version-requirements.patch"
        )
sha512sums=('SKIP'
        'SKIP'
        )

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
  cmake --build build/resources/etesync
}

package() {
  DESTDIR="$pkgdir" cmake --install build/resources/etesync
}
