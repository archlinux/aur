# Maintainer: workonfire <kolucki62@gmail.com>

_pkgname=compiler-screensaver
pkgname=$_pkgname-git
pkgver=r3.19ebf3a
pkgrel=1
pkgdesc="A screensaver, that simulates a compilation process."
arch=('any')
url="https://github.com/workonfire/CompilerScreensaver"
depends=('python-colorama')
provides=('compiler-screensaver')
conflicts=('compiler-screensaver')
source=("${pkgname}"::git+https://github.com/workonfire/CompilerScreensaver.git)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}"/{opt/"${_pkgname}",usr/bin}
    cp -r "${srcdir}"/"${pkgname}"/logs "${pkgdir}"/opt/"${_pkgname}"/
    install -Dm755 "${srcdir}"/"${pkgname}"/main.py "${pkgdir}"/opt/"${_pkgname}"/main.py
    ln -s "/opt/${_pkgname}/main.py" "${pkgdir}/usr/bin/compiler-screensaver"
}

