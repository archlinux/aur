#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-jquery-ui')
pkgname=('python-django-jquery-ui')
_module='django-jquery-ui'
pkgver='1.11.4'
pkgrel=2
pkgdesc="Widget and interaction library to build highly interactive web applications"
url="https://github.com/benbacardi/django-jquery-ui"
depends=('python' 'python-django-jquery')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-jquery-ui/django-jquery-ui-${pkgver}.tar.gz"
        "https://code.jquery.com/ui/1.11.4/jquery-ui.js"
        "LICENSE::https://github.com/benbacardi/django-jquery-ui/blob/master/LICENSE?raw=true"
        "addDevJS.patch")
sha256sums=('725d7beb5eac57e02a295f9d9db0277d3cc531156f0ff6ba8153442f79ec1210'
            '0c8e8d7408611519ceda4e759ae9987834a17addc8f0028241ffed7fb0113612'
            '163fe5c92fa1e7c0f31b8d70a2f4655879a57f42a4ea2387398bb45c374ba28f'
            'f99116386a8ae95f6de10b4b70d00b9d459ae9819e5dbf58b4883a1e8256cbf6')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    mv jquery_ui/static/js/jquery-ui.js jquery_ui/static/js/jquery-ui.min.js
    cp ../jquery-ui.js jquery_ui/static/js/
    patch -p1 < ../addDevJS.patch
}


package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
