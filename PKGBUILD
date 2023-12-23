# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: bb010g <bb010g@gmail.com>

pkgname=python-envtpl-git
pkgver=r82.b370fd3
pkgrel=1
pkgdesc='Render jinja2 templates on the command line using shell environment variables'
arch=('any')
url='https://github.com/andreasjansson/envtpl'
license=('GPL')
depends=(python{,-jinja})
makedepends=(git python-{setuptools,sh,six})
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("python-envtpl::git+https://github.com/andreasjansson/envtpl")
md5sums=('SKIP')

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

check() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py test
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize 1 --skip-build
}
