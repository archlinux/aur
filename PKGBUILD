# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname=hascal-git
_gitname=hascal
pkgdesc='Hascal is a general purpose and open source programming
language designed to build optimal, maintainable, reliable and efficient software.'
url='https://github.com/hascal/hascal'
arch=('i686' 'x86_64')
pkgrel=1
pkgver=v1.3.9.alpha.1.r14.g4bf922f
license=('MIT')
depends=('gcc' 'python' 'python-wheel' 'python-colorama' 'python-requests' )
makedepends=('git' 'pyinstaller')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=("git+https://github.com/hascal/hascal.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build(){
	cd "$srcdir/$_gitname"
	make build
}

package() {

    install -d "${pkgdir}/usr/share/licenses/${_gitname}"
    install -d "${pkgdir}/opt/${_gitname}"
    install -d "${pkgdir}/usr/bin"

    install -m644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"

    cp -r "${srcdir}/${_gitname}/dist/"* "${pkgdir}/opt/${_gitname}" -R
    echo "#!/usr/bin/bash\n/opt/hascal/hascal" > "${pkgdir}/usr/bin/${_gitname}"  
    chmod 644 /usr/bin/hascal
}
