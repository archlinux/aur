# Maintainer: Robert Tari <robert at tari dot in>

pkgname="cmake-extras-git"
_pkgname="cmake-extras"
pkgver=1.7.r4.g669add9
pkgrel=1
pkgdesc="A collection of add-ons for the CMake build tool"
arch=("any")
url="https://gitlab.com/ubports/development/core/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("cmake" "python" "bash")
makedepends=("git")
source=("${_pkgname}::git+https://gitlab.com/ubports/development/core/${_pkgname}.git")
md5sums=("SKIP")
options=("!emptydirs")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver()
{
    cd ${srcdir}/${_pkgname}
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

