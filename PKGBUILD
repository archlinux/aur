# Maintainer: wordofglass <wordofglass@users.noreply.github.com>

pkgname=beets-check-git
pkgver=0.9.2.r23.aafd2e4
pkgrel=1
pkgdesc="Verify and store checksums in your beets library"
arch=('any')
url="https://github.com/geigerzaehler/${pkgname%-git}"
license=('custom')
depends=('python2' 'beets>=1.3.7')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}

# vim: set et sw=4 ts=4 :
