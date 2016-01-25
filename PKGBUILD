# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Claudio Riva <firetux83@gmail.com>
pkgname=songs
pkgver=2.18
pkgrel=1
pkgdesc="A software suite that allows a user to create beautiful songbooks using LaTeX"
arch=('any')
url="http://songs.sourceforge.net/"
license=('GPL')
depends=('texlive-bin' 'texlive-core')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/Unix%20source/$pkgname-$pkgver.tar.gz)
install=songs.install
sha256sums=('a7b3f4628dbab8513c8ab6ac619ae4aded614023bee81e94c9985b56653b2091')

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
