# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='kp'
pkgname=("python-$_pkgname")
pkgver=0.8.0
pkgrel=2
pkgdesc="Python binding of Kompute: Blazing fast, mobile-enabled, asynchronous, and optimized for advanced GPU processing usecases."
arch=('x86_64')
depends=('python'
	     'vulkan-headers')
makedepends=('python-setuptools'
             'cmake'
             'gcc')
optdepends=('python-pyshader: Provide modern GPU shaders method'
            'glslang: Shader front end and validator')
checkdepends=('python-pytest' 'python-pyshader')
url='https://kompute.cc/'
license=('Apache')
sha256sums=('814615354d1c17603894f756ac9b45661f4ff78e7db894079e0693a8f89a401f')
_source_url="https://files.pythonhosted.org/packages/02/38/eebf1ab4b6fb22ce481e4ae638ff56a59eb76c466c8a21dcc473769a51ba"
source=("$_source_url/$_pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py build
}

check(){
    cd "$srcdir/$_pkgname-$pkgver/"
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest python/test
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
} 
