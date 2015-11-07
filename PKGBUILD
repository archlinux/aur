# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatmkfn-git
pkgver=0.r78.86b4342
pkgrel=1
epoch=
pkgdesc="Creates font description files for neatroff. It used to be called mktrfn."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom:BSD')
groups=()
depends=('gsfonts')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('neatmkfn')
conflicts=('neatmkfn')
replaces=('mktrfn')
backup=()
options=()
changelog=
install=
source=("$pkgname::git://repo.or.cz/neatmkfn.git")
noextract=()
md5sums=('SKIP')

## Ghostscript Fonts Location
FP="/usr/share/fonts/Type1/"

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all
  # Generation of fonts
  mkdir fonts
  ./gen.sh $FP fonts
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 mkfn   $pkgdir/usr/bin/neatmkfn
  install -Dm644 gen.sh $pkgdir/usr/share/doc/$pkgname/gen.sh
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  mkdir -p $pkgdir/usr/share/neatroff/font/devutf/
  cp $srcdir/$pkgname/fonts/* $pkgdir/usr/share/neatroff/font/devutf/
}

