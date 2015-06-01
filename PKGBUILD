# Maintainer: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=goomwwm-git
_gitname=goomwwm
pkgver=20150518
pkgrel=1
pkgdesc="Get out of my way, Window Manager!"
arch=('i686' 'x86_64')
url="http://github.com/seanpringle/goomwwm"
license=('MIT')
depends=('libx11' 'libxft' 'freetype2')
makedepends=('git')
provides=('goomwwm')
source=("git://github.com/seanpringle/goomwwm.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 755 $_gitname "$pkgdir/usr/bin/$_gitname"
  install -Dm 644 "$_gitname.desktop" "$pkgdir/usr/share/xsessions/$_gitname.desktop"
  gzip -c "$_gitname.1" > "$_gitname.1.gz"
  install -Dm644 "$_gitname.1.gz" "$pkgdir/usr/share/man/man1/$_gitname.1.gz"
}

