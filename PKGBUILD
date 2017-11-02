# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Claudio Riva <firetux83@gmail.com>
pkgname=songs
pkgver=3.0
pkgrel=1
pkgdesc="A software suite that allows a user to create beautiful songbooks using LaTeX"
arch=('any')
url="http://songs.sourceforge.net/"
license=('GPL')
depends=('texlive-bin' 'texlive-core')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/Unix%20source/$pkgname-$pkgver.tar.gz)
install=songs.install
sha256sums=('90e473d9fb50ae67646d8d915239492aa4b0cb9a80ddab484cfded8e8c281e81')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr \
        --with-texmf-path=/usr/share/texmf
  # Running make once fails, twice succeeds.  Patch?
  make || make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
