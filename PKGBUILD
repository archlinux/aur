#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=('python-django-swampdragon')
_module='SwampDragon'
pkgver='0.4.2.2'
pkgrel=4
pkgdesc="Combines the power of Django and Tornado for real-time web applications"
url="http://swampdragon.net"
depends=('python' 'python-tornado' 'python-django' 'python-redis' 'python-dateutil'
		 'redis'  'python-tornado-redis' 'python-sockjs-tornado')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/S/SwampDragon/SwampDragon-${pkgver}.tar.gz"
        "LICENSE.txt::https://github.com/jonashagstedt/swampdragon/blob/master/LICENSE.txt?raw=true"
        "fix_import_module.patch")
sha256sums=('8011141f7949bf1d16255d72d526ec751ab2e331c76f8d9dfbe99754a3b4ea94'
            'e6dda7a2f334343acadd30a8516e1bfb00293f5465e640dccccd836cf634bc70'
            '4ff2865fca78cac4dc3f1d83cabffeebb1c78db205457461569440455d375e8b')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < ../fix_import_module.patch
}
            
package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
