# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-pysftp
_name=${pkgname#python-}
pkgver=0.2.9
pkgrel=3
pkgdesc="A simple interface to SFTP for Python"
arch=('any')
url="https://bitbucket.org/dundeemt/pysftp"
license=('BSD')
depends=('python' 'python-paramiko>=1.17')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'curl')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz"
    "https://bitbucket.org/dundeemt/pysftp/raw/1c0791759688a733a558b1a25d9ae04f52cf6a64/LICENSE.txt")
sha256sums=(
    "fbf55a802e74d663673400acd92d5373c1c7ee94d765b428d9f977567ac4854a"
    "e648e3c7f439b52222a785a590223a0f7bad1a8a5fb89157d80d13123c7dcd25")

build() {
    cd "$_name-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl || exit
    install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
