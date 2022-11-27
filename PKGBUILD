# Maintainer: nichobi <nicholas@isacsson.se>

_pkgname=beets-yapl
pkgname=beets-yapl-git
pkgver=r7.d1179f9
pkgrel=1
pkgdesc="Beets plugin to handle yaml playlists"
arch=('any')
url="https://github.com/nichobi/$_pkgname"
license=('MIT')
depends=('python' 'beets>=1.4.7')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    rm 'beetsplug/__init__.py'
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

