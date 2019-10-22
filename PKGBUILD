# Maintainer: aksr <aksr at t-com dot me>
pkgname=xob-git
pkgver=0.1.r23.g2d4b5b3
pkgrel=1
epoch=
pkgdesc="A lightweight overlay volume (or anything) bar for the X Window System."
arch=('i686' 'x86_64')
url="https://github.com/florentc/xob"
license=('GPL3')
groups=()
depends=('libx11' 'libconfig')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" prefix="/usr" sysconfdir="/etc" install
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

