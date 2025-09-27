# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
pkgname=python-emport
_name=${pkgname#python-}
pkgver=1.4.1
pkgrel=1
pkgdesc="A small utility library for importing files by file name"
arch=('any')
url="https://github.com/vmalloc/emport"
license=('BSD-3-Clause')
depends=('python' 'python-logbook')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-hatchling'
             'python-hatch-vcs'
             'git')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dd5076e8b4b361c043c8778da228731fd7d75e5eaabab300eb5e95bbed76ed9a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
