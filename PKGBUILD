# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname='python-pynput'
pkgver=1.4.5
pkgrel=1
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/${_name}/archive/v${pkgver}.tar.gz"
        "python-pynput.patch")
sha512sums=('c008b3cb40eadcb7413f0d7e0f67b8cb17794fa27f48fab1f17f4fb2f4cd6baf56bca7de461a13b93e90adf9ad55239d3e242f1f723f2e908bc6f917373ca608'
            'fd25744095c3201335cf601ec7e514f4bb2943de777849b2e821168d4e61098ecc355cfa13eb07ede7c1b91fe63f694a1dd42b13b5d4b8796a593aa5acf908b9')
makedepends=('python-setuptools')
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

package_python-pynput() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}
