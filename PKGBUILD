pkgname=yaru-cursor-theme
pkgver=26.10.3
pkgrel=1
pkgdesc="Yaru cursor theme from Ubuntu"
arch=('any')
url="https://github.com/ubuntu/yaru"
license=('CC-BY-SA-4.0')
makedepends=(
	'meson' 
	'ninja' 
	'sassc'
	'libsass'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ac396932559dd1b515ee4d94d470093dfac407027d9609e756299df9e06c3f7b')

build() {
  arch-meson "yaru-$pkgver" build \
    -Dgnome-shell=false \
    -Dgtksourceview=false \
    -Dmetacity=false \
    -Dsounds=false \
    -Dsessions=false \
    -Ddark=false \
    -Daccent-colors=
  meson compile -C build
}

package() {
  DESTDIR="$srcdir/stage" meson install -C build
  install -d "$pkgdir/usr/share/icons/Yaru"
  cp -a "$srcdir/stage/usr/share/icons/Yaru/cursors" "$pkgdir/usr/share/icons/Yaru/"
}
