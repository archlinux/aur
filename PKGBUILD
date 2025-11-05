# Maintainer: dplusplus <echo YXZiZy9hdC91bmZhaXJ0b2lsZXQoZG90XXh5ego= | base64 -d>
# Contributor: Craig Jackson <tapocol@protonmail.com>

# This innoextract version is a PR at https://github.com/dscharrer/innoextract/pull/199 which fixes building innoextract with Boost 1.89.0.
# When that PR (or something similar) is merged, this package will have little reason to exist.

pkgname=innoextract-boost1.89.0-fix-git
pkgver=r923.882796e
pkgrel=1
pkgdesc="A tool to extract installers created by Inno Setup (with fix for Boost 1.89.0)"
url='https://constexpr.org/innoextract/'
arch=('x86_64')
license=('ZLIB')
depends=('boost-libs' 'xz')
makedepends=('boost' 'cmake' 'git')
provides=('innoextract')
conflicts=('innoextract')
source=("$pkgname::git+https://github.com/cho-m/innoextract.git#branch=boost-1.89.0")
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
