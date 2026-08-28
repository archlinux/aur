# Maintainer: tomparr <tomparr at protonmail dot com>
#

pkgname=innoextract-crazy-max-git
pkgver=r980.eef23e6
pkgrel=2
pkgdesc="A fork of innoextract, supporting newer installer formats created by InnoSetup"
url='https://github.com/crazy-max/innoextract'
arch=('x86_64')
license=('ZLIB')
depends=('boost-libs' 'xz')
makedepends=('boost' 'cmake' 'git')
provides=('innoextract' 'innoextract-crazy-max')
conflicts=('innoextract' 'innoextract-git')
source=(
    "$pkgname::git+https://github.com/crazy-max/innoextract.git"
)
sha256sums=(
    'SKIP'
)


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -m644  CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

