# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=quilter
pkgver=1.5.4
pkgrel=1
pkgdesc="Focus on your writing for any kind of story, even longer ones."
arch=(any)
url="https://github.com/lainsce/quilter"
depends=(granite gtksourceview3 gtk3 glib2 vala discount webkit2gtk gtkspell3)
makedepends=(unzip ninja meson)
install=quilter.install

source=(
  "https://github.com/lainsce/quilter/archive/${pkgver}.zip"
)
sha256sums=('b2e2113c439680e000cf91ed998171c7bb09fefa9a14bded5dc32391c163df29')

build () {
  cd $srcdir/$pkgname-$pkgver
  patch meson.build -i ../../meson.build.patch
  meson build && cd build
  meson configure -Dprefix=${pkgdir}/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  DESTDIR="$pkgdir" ninja install
}
