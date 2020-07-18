# Maintainer: hexptr <hexptr@protonmail.com>
pkgname=streamdeck-ui-git
_pkgname=streamdeck-ui
pkgver=r102.96f2305
pkgrel=1
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://timothycrosley.github.io/streamdeck-ui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside2' 'python-pynput' 'python-elgato-streamdeck')
makedepends=('git' 'python-dephell' 'python-setuptools')
provides=('streamdeck-ui')
source=("git+https://github.com/timothycrosley/streamdeck-ui.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$_pkgname"
    python setup.py build
}

package() {
	cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
