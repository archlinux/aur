# Maintainer: Campbell Barton <ideasman42@gmail.org>
_pkgname=3270-fonts
_gitname=3270font
pkgname=$_pkgname
pkgver=853.fd00815
pkgrel=1
pkgdesc="A font for the nostalgic from a 3270 series terminal."
arch=('any')
url="https://github.com/rbanffy/$_gitname"
license=('BSD')
makedepends=('fontforge')
depends=('xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale' 'fontconfig')
source=("3270font::git+https://github.com/rbanffy/3270font.git")
md5sums=('SKIP')

install=install

pkgver() {
  cd $_gitname
  echo $(git rev-list --count main).$(git rev-parse --short main)
}

build() {
  cd "$srcdir/$_gitname"
  make font
}

package() {
  cd "${srcdir}/$_gitname"
  make font
  install -d "$pkgdir/usr/share/fonts/local"
  install -m644 build/*.otf "$pkgdir/usr/share/fonts/local/"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
