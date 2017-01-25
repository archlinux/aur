# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbpad-mkfn-git
pkgver=r3.8901524
pkgrel=2
epoch=
pkgdesc="Create fbpad font files."
arch=('i686' 'x86_64')
url="http://repo.or.cz/fbpad_mkfn.git"
url="http://litcave.rudi.ir/"
license=('custom:BSD')
groups=()
#depends=('freetype2')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('ft2tf' 'fbpad-mkfn')
conflicts=('fbpad-mkfn')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://repo.or.cz/fbpad_mkfn.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  ## if compiled with freetype2 support, package depends on freetype2:
  #sed -i '5s/^/#/; 6s/^/#/; 7s/^/#/; 10s/^#//; 11s/^#//; 12s/^#//' Makefile

  ## gen.sh adjustments
  sed -i '4s@"/path/to/fonts"@"/usr/share/fonts/TTF/" # path to fonts@g' gen.sh
  sed -i 's@./mkfn@fbpad-mkfn@g' gen.sh
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 mkfn $pkgdir/usr/bin/fbpad-mkfn
  install -Dm755 gen.sh $pkgdir/usr/share/doc/${pkgname%-*}/gen.sh
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}

