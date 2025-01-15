# Maintainer: a821 at mail de
# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: Alex Chamberlain <alex@alexchamberlain.co.uk>
# Contributor: Kars Wang <jaklsy@gmail.com>

pkgname=jq-git
pkgver=1.7.1.r83.g588ff187
pkgrel=1
pkgdesc='Command-line JSON processor'
arch=('i686' 'x86_64')
url='http://stedolan.github.io/jq/'
license=('custom')
depends=('oniguruma')
makedepends=('git')
provides=('jq')
conflicts=('jq')
source=('git+https://github.com/stedolan/jq.git')
sha512sums=('SKIP')
_gitname=jq

pkgver() {
    cd "$_gitname"
    git describe --long --tags | sed -e 's/^jq-//' -e 's/-/.r/;s/-/./g'
}

build() {
    cd "$_gitname"

    autoreconf -i
    ./configure --prefix=/usr --disable-docs
    make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
