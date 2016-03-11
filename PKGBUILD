#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=('python-django-swampdragon')
_module='SwampDragon'
pkgver='0.4.2.2'
pkgrel=12
pkgdesc="Combines the power of Django and Tornado for real-time web applications"
url="http://swampdragon.net"
depends=('python' 'python-tornado' 'python-django' 'python-redis' 'python-dateutil'
		 'redis'  'python-tornado-redis' 'python-sockjs-tornado')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/S/SwampDragon/SwampDragon-${pkgver}.tar.gz"
        "LICENSE.txt::https://github.com/jonashagstedt/swampdragon/blob/master/LICENSE.txt?raw=true"
        "fiximport-import_module.patch"
        "fiximport-get_model.patch"
        "fiximport-model_tools.patch"
        "fiximport-import_module2.patch"
        "fixversion-requires.patch"
        "fixversion-setup.patch"
        "fix18syntax.patch"
        "fiximport-object_map.patch"
        "fixformat-templatetags.patch")
sha256sums=('8011141f7949bf1d16255d72d526ec751ab2e331c76f8d9dfbe99754a3b4ea94'
            'e6dda7a2f334343acadd30a8516e1bfb00293f5465e640dccccd836cf634bc70'
            '4ff2865fca78cac4dc3f1d83cabffeebb1c78db205457461569440455d375e8b'
            '9ea5e3e196d8d1f444c59f246994ca3bad3200c2a25ce5796e887741fe78c1e4'
            '2dd5797ceea5adff7b537d679372defea0ac4bf5e4afb5141b5c4d463c92e7eb'
            'c5e94331f96b17b8f5513a331d79d995770626c998d2980d6f6caa068e43a532'
            'd6d2e5915c35f25635391705e84df5eff91b916543d89e32b8a99e6523ce2728'
            'c689e31436ea58c8577c8f62d9e09d491a964c720f8211641d9e0cce56dafbb7'
            '226de1b9f084c6c292788f00d080f8ed12fa3686f8e0d57fef632ee1dc7d7e01'
            'd31f4fb1eaffa9c870603a0691bc6569d6149c59847ec8bfd3cea96e846ef128'
            'ed1f41b14845f4ea87fc6d9c8dd5884ff48d622d539f109a9341e80f86ff1e46')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < ../fiximport-import_module.patch
    patch -p1 < ../fiximport-get_model.patch
    patch -p1 < ../fiximport-model_tools.patch
    patch -p1 < ../fiximport-import_module2.patch
    patch -p1 < ../fixversion-requires.patch
    patch -p1 < ../fixversion-setup.patch
    patch -p1 < ../fix18syntax.patch
    patch -p1 < ../fiximport-object_map.patch
    patch -p1 < ../fixformat-templatetags.patch
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
