# Maintainer: taotieren <admin@taotieren.com>

_pkgname=proj2cmake
pkgname=proj2cmake-git
pkgver=22a7e6b
pkgrel=1
pkgdesc="Convert an entire Visual Studio solution and all contained projects to CMake."
arch=('any')
url="https://github.com/mrpi/proj2cmake"
license=('Boost Software License 1.0')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=('cmake')
makedepends=('git' 'cmake')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}::git+https://github.com/mrpi/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() 
{
    cd "${srcdir}/${_pkgname}/"
    git describe --always | sed 's|-|.|g'
}

build() 
{
    cd ${srcdir}/${_pkgname}/
    cmake . && make
}

package() 
{
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_1_0.txt"
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
