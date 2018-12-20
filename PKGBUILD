# maintainer: lorelei <eel@sdf.org>

pkgname=confusion-git
pkgver=33.1f416f3
pkgrel=1
pkgdesc="A MDL interpreter"
arch=('i686' 'x86_64')
provides=('confusion')
url='http://gitlab.com/emacsomancer/confusion-mdl'
license=('GPL')
source=("git+https://gitlab.com/emacsomancer/confusion-mdl.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}"
    cd confusion-mdl

    printf "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}"
    cd confusion-mdl

    make

    install -Dm755 mdli "${pkgdir}"/usr/bin/mdli
    ln -s /usr/bin/mdli "${pkgdir}"/usr/bin/confusion

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
