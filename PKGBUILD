# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
pkgver=master
_pkgname="$pkgname-$pkgver"
pkgrel=3
pkgdesc="Free GNU/Linux music production system (DAW)"
arch=('x86_64')
url="https://git.zrythm.org/zrythm/zrythm"
license=('GPL3')
depends=('gtk3' 'lv2' 'lilv' 'jack' 'libsndfile' 'libsmf' 'libdazzle'
         'breeze-icons' 'portaudio' 'ffmpeg')
source=("$_pkgname::https://git.zrythm.org/zrythm/zrythm/-/archive/$pkgver/zrythm-$pkgver.tar.gz"
        "libcyaml::https://github.com/tlsa/libcyaml/archive/v0.1.0.tar.gz"
        "suil::https://git.zrythm.org/zrythm/suil/-/archive/master/suil-master.tar.gz")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
  cp -r $srcdir/libcyaml-0.1.0/* ./ext/libcyaml/
  cp -r $srcdir/suil-master/* ./ext/suil/
}

build() {
	cd "$srcdir/$_pkgname"
  autoreconf -fi
	./configure --prefix=/usr --enable-aur-build
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
