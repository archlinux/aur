# Maintainer: dringsim <dringsim@qq.com>
# Contributor: Will Haines <w@willhaines.me>
pkgname="python-pythonnet"
_name="${pkgname#python-}"
pkgver=3.0.5
pkgrel=1
pkgdesc="pythonnet provides integration with the .NET Common Language Runtime (CLR)"
arch=(any)
url="https://pythonnet.github.io/"
license=("MIT")
depends=("python-clr_loader" "mono")
makedepends=("nuget" "python-wheel")
provides=("python-pythonnet")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('48e43ca463941b3608b32b4e236db92d8d40db4c58a75ace902985f76dac21cf')

build () {
    cd "$_name-$pkgver"
    # workaround for https://github.com/pythonnet/pythonnet/issues/654
    # touch tools/geninterop/fake_libc_include/crypt.h
    python setup.py bdist_wheel
}

package () {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
