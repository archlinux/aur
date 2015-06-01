# Maintainer: Brian Bidulock <bidulock@Openss7.org>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=goomwwm-git
_pkgname=goomwwm
pkgver=1.0.0.73.g25c9a12
pkgrel=2
epoch=1
pkgdesc="Get out of my way, Window Manager!"
arch=('i686' 'x86_64')
url="http://github.com/seanpringle/goomwwm"
license=('MIT')
depends=('libxft' 'libxinerama')
optdepends=('dmenu')
makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$pkgname::git://github.com/seanpringle/goomwwm.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long|sed 's,[-_],.,g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 "$_pkgname.desktop" "$pkgdir/usr/share/xsessions/$_pkgname.desktop"
  gzip -c "$_pkgname.1" > "$_pkgname.1.gz"
  install -Dm644 "$_pkgname.1.gz" "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

