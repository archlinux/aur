# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname=hascal-git
_gitname=hascal
pkgdesc='Hascal is a general purpose and open source programming
language designed to build optimal, maintainable, reliable and efficient software.'
url='https://github.com/hascal/hascal'
arch=('i686' 'x86_64')
pkgrel=1
pkgver=v1.3.7.r10.gb6e2bd3
license=('MIT')
depends=('gcc' 'python' 'python-wheel' 'python-colorama' 'python-requests' )
makedepends=('python-pip')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=("git+https://github.com/hascal/hascal.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    make deps
    make
}
package() {
    
    install -d "${pkgdir}/usr/share/licenses/${_gitname}"
    install -d "${pkgdir}/opt/${_gitname}"
    install -d "${pkgdir}/usr/bin"

    install -m644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"

    cp -r "${srcdir}/${_gitname}/dist/"* "${pkgdir}/opt/${_gitname}" -R

	install -m755 "${srcdir}/${_gitname}/bin/run.sh" "${pkgdir}/usr/bin/hascal"
}
