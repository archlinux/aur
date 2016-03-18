#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-jquery')
pkgname=('python-django-jquery')
_module='django-jquery'
pkgver='1.12.2'
pkgrel=2
pkgdesc="A fast, small, and feature-rich JavaScript library for Django."
url="http://bitbucket.org/massimilianoravelli/django-jquery"
depends=('python' 'python-django')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-jquery/django-jquery-${pkgver}.tar.gz"
        "http://code.jquery.com/jquery-1.12.2.js"
        "addDevJS.patch"
        "LICENSE.txt")
sha256sums=('99cebaa1f066550ffe1a4b149571287915a19dd2feef8632c1ee19f97738a0bb'
            '5540b2af46570795610626e8d8391356176ca639b1520c4319a2d0c7ba9bef16'
            'e35d8ea8c655d87c73e8af7994457c659806bf8fcc3b478364f3d582edd97039'
            '8d06f8ac7d899abd8c3f4345776d9fe61a433171988e661a78c342f69862eb9d')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    mv jquery/static/js/jquery.js jquery/static/js/jquery.min.js
    cp ../jquery-1.12.2.js jquery/static/js/
    patch -p1 < ../addDevJS.patch
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
