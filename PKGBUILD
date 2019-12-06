# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname='python2-pynput'
pkgver=1.5.2
pkgrel=1
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/${_name}/archive/v${pkgver}.tar.gz"
        "python2-pynput.patch")
sha512sums=('8aa54958bf5f48bdbda72f72c38f3302ddbfcde46c4d7fecf8e19f3ce2addecbd83993b97ce3012eda6ccc0b89157329e14b4c76022b4f832d39321bd253acda'
            'fd25744095c3201335cf601ec7e514f4bb2943de777849b2e821168d4e61098ecc355cfa13eb07ede7c1b91fe63f694a1dd42b13b5d4b8796a593aa5acf908b9')
makedepends=('python2-setuptools')
depends=('python2-xlib' 'python2-six' 'python2-enum34')
optdepends=('python2-sphinx: build online documentation')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch -Np1 -i "${srcdir}/python2-pynput.patch"
}

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python2 setup.py build
}


package() {
    cd "$srcdir/${_name}-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}
