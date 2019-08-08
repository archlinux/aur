# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgbase=python-pynvim
pkgname=('python-pynvim' 'python2-pynvim')
pkgver=0.3.2
pkgrel=2
pkgdesc="python client and plugin host for nvim / neovim"
url="https://github.com/neovim/pynvim"
makedepends=('python-setuptools' 'python2-setuptools')
license=('APACHE-2.0')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('0a44c540dd5790acfbc7e411b0ed4fb6c44914d866226ebebf370c24c2723dc2')

prepare() {
    cp -a pynvim-$pkgver{,-py2}
}

build() {
    cd $srcdir/pynvim-$pkgver
    python setup.py build

    cd $srcdir/pynvim-$pkgver-py2
    python2 setup.py build
}

package_python-pynvim() {
    depends=('python' 'python-msgpack' 'python-greenlet')

    cd $srcdir/pynvim-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pynvim() {
    depends=('python2' 'python2-msgpack' 'python2-greenlet')

    cd $srcdir/pynvim-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
