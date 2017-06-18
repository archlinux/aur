# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=drumgizmo
pkgver=0.9.14
pkgrel=2
pkgdesc="an open source cross-platform drum plugin and stand-alone application (lv2)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.drumgizmo.org"
license=('GPL')
groups=('lv2-plugins')
depends=('libsmf' 'libxext' 'expat' 'jack' 'zita-resampler')
makedepends=('lv2')
source=("http://www.drumgizmo.org/releases/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        "http://www.steinberg.net/sdk_downloads/vstsdk367_03_03_2017_build_352.zip")
md5sums=('028a9c352e6c44d4d56d73b84d640941'
         'b4ed4f4f4be77b267f1821fc1413ea36')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
              --enable-lv2 \
              --enable-vst \
              --with-vst-sources="$srcdir/VST_SDK/VST2_SDK"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
