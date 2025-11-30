# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: neodarz <neodarz at neodarz dot net>

_pkgname=eradicate
pkgname=python-$_pkgname

pkgver=3.0.1
pkgrel=1
pkgdesc="Removes commented-out code from Python files"
url='https://github.com/PyCQA/eradicate'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'LICENSE')
sha512sums=('623ce5431f93ba0f4b9cb1bdf18411ae9df98df770c0551d72175b3f910ee64dff9faadda27625651f653b1029a6144b8f331805ec11627cf5dff0c73319d863'
            '4b12045cce4ecf6b95d2a12f7e77857f458abd779c37c1c09f2ff109ea2cf312df520c2a469c1a10a7a63e3a4c7c04e698bcbde3c49861fe19988963e263a750')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    python -m unittest discover -v
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
