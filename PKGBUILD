# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname=hascal-git
_gitname=hascal
pkgdesc='Hascal is a general purpose and open source programming
language designed to build optimal, maintainable, reliable and efficient software.'
url='https://github.com/hascal/hascal'
arch=('i686' 'x86_64')
pkgrel=1
pkgver=v1.3.9.rc.2.r14.g27efa8a
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

package() {

    cd "$srcdir/$_gitname"

    install -d "${pkgdir}/usr/share/licenses/${_gitname}"
    install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"

    pyinstaller --add-data src/hlib:hlib "src/hascal.py" --name "hascal" --noconfirm --onefile --console
}
