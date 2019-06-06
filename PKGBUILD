# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Claudio Riva <firetux83@gmail.com>
pkgname=songs
pkgver=3.1
pkgrel=1
pkgdesc="A software suite that allows a user to create beautiful songbooks using LaTeX"
arch=('any')
url="http://songs.sourceforge.net/"
license=('GPL')
depends=('texlive-bin' 'texlive-core')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/Unix%20source/$pkgname-$pkgver.tar.gz)
install=songs.install
sha256sums=('fc0940cdfc7cd7eb899ebba1b4e19ee3dc55e400b9d18d7c50b267c0c1ccf43f')

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
