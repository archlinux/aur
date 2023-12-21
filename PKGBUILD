# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-pysftp
_name=${pkgname#python-}
pkgver=0.2.9
pkgrel=2
pkgdesc="A simple interface to SFTP for Python"
arch=('any')
url="https://bitbucket.org/dundeemt/pysftp"
license=('BSD')
depends=('python' 'python-paramiko>=1.17')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'curl')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("fbf55a802e74d663673400acd92d5373c1c7ee94d765b428d9f977567ac4854a")

build() {
    cd "$_name-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl || exit
    curl "https://bitbucket.org/dundeemt/pysftp/raw/918494eef04e56f91cbff99c422bb57e21f4e257/LICENSE.txt" -o LICENSE.txt || exit
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
