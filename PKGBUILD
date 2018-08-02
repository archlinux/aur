# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="pd-aubio-git"
pkgver=r67.30796dc
pkgrel=1
pkgdesc="Various externals for PureData using the aubio library"
arch=('any')
url="https://github.com/aubio/pd-aubio/"
license=('GPL')
makedepends=('git' 'bzip2' 'python' )
depends=( 'aubio' )
source=("$pkgname-$pkgver.tar.gz::https://github.com/aubio/pd-aubio/archive/$pkgver.tar.gz")
source=("git+https://github.com/aubio/pd-aubio.git")
sha256sums=('SKIP')

_gitroot=https://github.com/aubio/$pkgname.git
_gitname=pd-aubio

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/$_gitname"
    make WAFOPTS='--prefix=/usr' configure
}

package() {
    cd "${srcdir}/$_gitname"
    make WAFOPTS="--destdir=\"$pkgdir\"" install
}
