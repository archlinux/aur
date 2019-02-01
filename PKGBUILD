# Maintainer: Craig Jackson <tapocol@protonmail.com>

pkgname=innoextract-git
pkgver=r703.c9dcf5f
pkgrel=1
pkgdesc="A tool to extract installers created by Inno Setup"
url='https://constexpr.org/innoextract/'
arch=('x86_64')
license=('ZLIB')
depends=('boost-libs' 'xz')
makedepends=('boost' 'cmake' 'git')
provides=('innoextract')
conflicts=('innoextract')
source=("$pkgname::git+https://github.com/dscharrer/innoextract.git")
sha256sums=('SKIP')


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
