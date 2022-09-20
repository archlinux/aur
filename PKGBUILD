# Maintainer: Robert Tari <robert at tari dot in>

pkgname="cmake-extras-git"
_pkgname="cmake-extras"
pkgver=r283
pkgrel=1
pkgdesc="A collection of add-ons for the CMake build tool"
arch=("any")
url="https://gitlab.com/ubports/core/${_pkgname}"
license=("LGPL3")
depends=("cmake" "python")
makedepends=("git" "cmake")
source=("${_pkgname}::git+https://gitlab.com/ubports/core/${_pkgname}.git")
md5sums=("SKIP")
options=("!emptydirs")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver()
{
    cd ${srcdir}/${_pkgname}
    printf "r%s" "$(git rev-list --count HEAD)"
}

build()
{
    cd ${srcdir}/${_pkgname}
    cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package()
{
    cd ${srcdir}/${_pkgname}
    DESTDIR=${pkgdir} cmake --install build
}

