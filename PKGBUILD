# Maintainer: Max <ulidtko@gmail.com>
pkgname=botox-git
pkgver=r41.a85342a
pkgrel=1
pkgdesc="ELF patching tool"
arch=('any')
url="https://github.com/devttys0/botox"
license=('unspecified')
groups=('Tools/Debugging')
depends=('python')
makedepends=('git')
provides=('botox' 'python-botox')
source=(
    'git+https://github.com/devttys0/botox.git#branch=master'
    '0001-Py3-support.patch'
    '0002-Use-absolute-imports.patch'
)
sha1sums=(
    'SKIP'
    'cde7770cda2510958c34f40bdeae6a4fc65854d9'
    '35e695efd29aa93e6527f87fd95059e6dcb9cf01'
)

pkgver() {
    cd "${pkgname%-git}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}/"
    patch -p1 -i "$srcdir/0001-Py3-support.patch"
    patch -p1 -i "$srcdir/0002-Use-absolute-imports.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
