# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kyle Laker <kyle+aur at laker dot email>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname='python-click-completion'
_pkgname="${pkgname#python-}"
pkgver='0.5.2'
pkgrel=11
pkgdesc='Add or enhance bash, fish, zsh and powershell completion in Click'
arch=('any')
url='https://github.com/click-contrib/click-completion'
license=('MIT')
depends=('python-click' 'python-jinja' 'python-six' 'python-shellingham')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4c7b8b3e78124e1005c9f221a2123b6ec02f3942d2be10f79fe3a5c96a52a96c')

build() {
    cd "$_pkgname-$pkgver"
    python -m build -wn
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
