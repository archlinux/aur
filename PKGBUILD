# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname='python-pynput'
pkgver=1.6.5
pkgrel=1
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/${_name}/archive/v${pkgver}.tar.gz"
        "python-pynput.patch")
sha512sums=('52ea1a36843ecfefbc2cb9fc96db29b90367bac06c4f6ecb16da1f6e7f9cde04ea0717927406ef110932974f3a010c4ca18924acc096ab914579ebcb9a0ba9f3'
            'fd25744095c3201335cf601ec7e514f4bb2943de777849b2e821168d4e61098ecc355cfa13eb07ede7c1b91fe63f694a1dd42b13b5d4b8796a593aa5acf908b9')
makedepends=('python-setuptools' 'python-setuptools-lint')
depends=('python-xlib' 'python-six')
optdepends=('python-sphinx: build online documentation')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch -Np1 -i "${srcdir}/python-pynput.patch"
}

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}
