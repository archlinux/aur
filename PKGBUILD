# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=drive-git
pkgver=r369.a4cfe9a
pkgrel=1
pkgdesc="Drive is a tiny program to pull or push Google Drive files. You need go1.2 installed in order to build the program."
arch=('any')
url="https://github.com/odeke-em/drive"
license=('Apache')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('go' 'git')
conflicts=('drive')
options=('!strip' '!emptydirs')
install=$pkgname.install
source=($pkgname::git+https://github.com/odeke-em/drive.git)
md5sums=('SKIP')
_gourl=github.com/odeke-em/drive/drive-gen
pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH=$srcdir
  go get $_gourl
  cd $srcdir/bin/
  ./drive-gen
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 $srcdir/bin/drive "$pkgdir/usr/bin"
  
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes"
  cp $srcdir/$pkgname/icons/*.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes
  mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/mimetypes"
  cp $srcdir/$pkgname/icons/*.svg $pkgdir/usr/share/icons/hicolor/scalable/mimetypes

}
