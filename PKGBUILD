# Maintainer: Benjamin Abadie <benjamin.abadie enix fr>

pkgname=python-nornir
_pkgname=nornir
pkgver=2.4.0
pkgrel=2
pkgdesc="Pluggable multi-threaded framework to help operate collections of devices"
arch=('any')
url="https://nornir.readthedocs.io/"
license=('Apache')
depends=('python>=3.6'
        'python-colorama>=0.4.1'
        'python-jinja>=2'
        'python-napalm'
        'python-netmiko>=2.4'
        'python-paramiko>=2.7'
        'python-requests>=2'
        'python-ruamel-yaml>0.16'
        'python-mypy_extensions>=0.4.1'
        'python-typing_extensions'
        'python-pyeapi')
makedepends=('git' 'python-poetry' 'python-setuptools')
source=("git+https://github.com/nornir-automation/nornir.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
    cd "$_pkgname"
    poetry build
    cd dist/
    tar xvf "$_pkgname-$pkgver.tar.gz"
    cd "$_pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname/dist/$_pkgname-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
