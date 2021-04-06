# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=xmountains-git
_pkgname=${pkgname%-git}
pkgdesc='Fractal Generator for the xwindow system, intergrates with xscreensaver'
pkgver=r187.d5301c8
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/spbooth/xmountains'
_branch='master'
license=('custom')
depends=('libx11' )
makedepends=('imake' 'xbitmaps')
source=("$_pkgname::git+$url.git#branch=$_branch")
sha256sums=('SKIP')
sha512sums=('SKIP')
b2sums=('SKIP')
provides=($pkgname)
conflicts=($pkgname)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  xmkmf
  make
}

package() {
  install -D -m755 "$_pkgname/$_pkgname" "$pkgdir"/usr/bin/$_pkgname
  install -D -m644 "$_pkgname/$_pkgname.man" \
    "$pkgdir"/usr/share/man/man1/$_pkgname.1
  install -D -m644 "$_pkgname/copyright.h" \
    "$pkgdir"/usr/share/licenses/$_pkgname/copyright.h
}
