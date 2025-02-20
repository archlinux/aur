# Maintainer: Mohamed Feddad <mrf345@gmail.com>

pkgname=xontrib-term-integrations-git
pkgver=r53.ab5fc71
pkgrel=1
pkgdesc="iTerm2, kitty, and WezTerm shell integrations for Xonsh"
arch=('any')
url="https://github.com/jnoortheen/xontrib-term-integrations/"
license=('MIT')
source=("git+$url")
depends=('xonsh' 'python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
provides=("xontrib-term-integrations")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
