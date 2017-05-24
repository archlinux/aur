# Maintainer: Evgeniy Filimonov <evgfilim1@gmail.com>
pkgname=('python-telegram-bot-git')
pkgver=6.0.1.r3.ff897ce
_pkgver=6.0.1
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
arch=('any')
url="https://github.com/${pkgname%-git}/${pkgname%-git}"
license=('LGPL3')
depends=('python-future>=0.15.2' 'python-certifi')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
changelog='CHANGES.rst'
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

pkgver() {
    cd "$srcdir/$pkgname"
    # printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    printf "%s" "$(git describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build -q
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install -q --root="$pkgdir" --optimize=1
}
