# Contributor: Ondřej Šponar
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lexend-fonts-git
pkgver=r114.7894f02
pkgrel=2
epoch=1
pkgdesc='Lexend is a variable typeface designed to improve reading fluency'
url="https://lexend.com"
arch=(any)
license=(custom:OFL-1.1)
makedepends=('git')
conflicts=('lexend-fonts')
provides=('lexend-fonts')
source=('lexend-fonts-git::git+https://github.com/googlefonts/lexend')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

# If you want to build the fonts yourself, install gftools from AUR
# and uncomment the build function. But be aware: gftools is not a cheap makedep.

#build() {
#  cd $pkgname/sources
#  . ./build.sh
#}
  
package() {
  find . -name "*.ttf" | xargs install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" 
  install -Dm644 $pkgname/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
