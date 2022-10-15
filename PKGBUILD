# Maintainer: Josep Mengual <josep at truita dot es>

pkgname=newleaf
_repo=NewLeaf
pkgdesc="A YouTube data extractor, compatible with the Invidious API."
pkgver=r119.714f103
pkgrel=1
arch=('x86_64')
url="https://sr.ht/~cadence/tube/"
license=('AGPL3')
makedepends=(git)
depends=(python python-cherrypy yt-dlp python-cachetools python-dateutil python-requests)
provides=('newleaf')
conflicts=('newleaf')
source=("git+https://git.sr.ht/~cadence/$_repo"
	'newleaf'
)
sha256sums=('SKIP'
	    '0d36db5aa76a2ba406a3e68c52739af4bd2931fa1842c9455a89dbda9df22b8e'
)
install=post.install

pkgver() {
    cd "$_repo"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_repo"
    rm LICENSE requirements.txt README.md Dockerfile
    mv configuration.sample.py configuration.py
}

package() {
    install -Dm755 newleaf "$pkgdir/usr/bin/newleaf"
    cd "$_repo"
    mkdir -p "$pkgdir/opt/newleaf"
    cp -r * "$pkgdir/opt/newleaf"
}
