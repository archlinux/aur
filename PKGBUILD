# Maintainer: Johannes Janssen <0xJJ@hanni.dev>
_pkgname=spin2cpp
pkgname="${_pkgname}-git"
pkgver=v7.7.3.r28.ga487858
pkgrel=1
pkgdesc="Tool to convert Parallax Propeller Spin code to PASM, C++ or C"
arch=('x86_64' 'i686')
url="https://github.com/totalspectrum/${_pkgname}"
license=('MIT')
groups=()
optdepends=('tcl' 'tk')
makedepends=('git')
provides=("${pkgname}")
conflicts=('spin2cpp')
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/totalspectrum/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
    cd "${srcdir}/${_pkgname}"
    make
}

package()
{
    cd "${srcdir}/${_pkgname}"
    install -Dm 755 "build/spin2cpp" "${pkgdir}/usr/bin/spin2cpp"
    install -Dm 755 "build/flexspin" "${pkgdir}/usr/bin/flexspin"
    install -Dm 755 "build/flexcc" "${pkgdir}/usr/bin/flexcc"
    install -Dm 755 "spinconvert/spinconvert.tcl" "${pkgdir}/usr/bin/spinconvert"
    install -dm755 "${pkgdir}/usr/share/spin2cpp"
    cp -r include "${pkgdir}/usr/share/spin2cpp/"
    install -Dm 755 "COPYING" "${pkgdir}//usr/share/licenses/${_pkgname}/COPYING"
    install -Dm 755 "COPYING.LIB" "${pkgdir}//usr/share/licenses/${_pkgname}/COPYING.LIB"
}
