# Maintainer: wisp3rwind <17089248+wisp3rwind@users.noreply.github.com>

pkgname=beets-alternatives-git
pkgver=0.10.1.r22.gfb23fe0
pkgrel=1
pkgdesc="Beets plugin to manage external files"
arch=('any')
url="https://github.com/geigerzaehler/${pkgname%-git}"
license=('MIT')
depends=('python' 'beets>=1.4.7')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    rm 'beetsplug/__init__.py'
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
