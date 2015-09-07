# Maintainer: Benjamin Chrétien <chretien + aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=rofi
pkgver=0.15.8
pkgrel=1
pkgdesc="Popup window switcher roughly based on superswitcher, requiring only xlib and xft."
arch=('i686' 'x86_64')
url="https://davedavenport.github.io/rofi/"
license=('MIT')
makedepends=()
depends=('libx11' 'libxft' 'freetype2' 'libxdg-basedir' 'libxinerama' 'pango')
optdepends=('i3-wm: use as a window switcher')
source=("https://github.com/DaveDavenport/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('04a83e6ff248b8cf6e100775522e483e91bd1cd00ac7b177650d1dc918c2a61d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix automake version mismatch
  autoreconf -i

  # Default compiler = clang, which can be a problem if using hardening-wrapper
  CC=gcc ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install install-man DESTDIR="$pkgdir"

  # Install examples to /usr/share/doc/rofi/examples
  install -dm755 "$pkgdir/usr/share/doc/rofi/examples"
  install -Dm755 Examples/*.sh "$pkgdir/usr/share/doc/rofi/examples"
}
