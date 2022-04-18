# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='kp'
pkgname=("python-$_pkgname")
pkgver=0.8.1
pkgrel=1
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
sha256sums=('6194c8318a7ec1fee744089110c11effdc2cac907fd3267a35c3ac96b1c916cb')
_source_url="https://files.pythonhosted.org/packages/b5/87/cf2bf85dc54fa2f7e8f056498ab3946eb795ce3e279e5ab1f33285938e3c"
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
