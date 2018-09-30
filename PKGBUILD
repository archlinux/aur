# Maintainer: Marcel Robitaille mail@marcelrobitaille.me
_pkgname=perspektiv
pkgname=${_pkgname}-git
pkgver=r14.168db07
pkgrel=1
pkgdesc="A daemon for creating popups when you change monitor brightness, volume, etc. "
arch=("i686" "x86_64")
url="https://github.com/henriklaxhuber/perspektiv"
license=('MIT')
depends=('ttf-font-awesome-4')
makedepends=('git' 'rust')
source=('perspektiv-git::git+https://github.com/henriklaxhuber/perspektiv.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
  CARGO_INCREMENTAL=0 cargo build --release --features "x11_backlight alsa_volume"
}

package() {
	cd "$srcdir/${pkgname}"
  mkdir -p "$pkgdir/usr/share/${_pkgname}"
  mkdir -p "$pkgdir/usr/bin"
	cp -r target/release/* "$pkgdir/usr/share/${_pkgname}"
  ln -s "$pkgdir/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

