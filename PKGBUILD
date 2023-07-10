# Maintainer: Corey Powell (mistdragon100@gmail.com)
# This is based off the tagged releases in the official hashlink repo
# So if you want official releases, this is the PKGBUILD for you.
pkgname=hashlink
pkgver=1.13
pkgrel=3
pkgdesc="A virtual machine for Haxe (tagged releases)"
url="https://hashlink.haxe.org/"
arch=(x86_64)
license=('MIT')
conflicts=('hashlink-git')
makedepends=()
depends=(
  'libpng'
  'libjpeg-turbo'
  'libvorbis'
  'openal'
  'sdl2'
  'mbedtls2'
  'libuv'
  'glu'
)
source=("https://github.com/HaxeFoundation/hashlink/archive/${pkgver}.tar.gz"
        "mbedtls2-Makefile.patch")
sha256sums=('696aef6871771e5e12c617df79187d1761e79bcfe3927531e99f665a8002956f'
            '3d272e39333fbf0cbe17667f608a7616a3eef543fb574e1e9b51460f8b5f3db0')

prepare() {
  patch "$srcdir/${pkgname}-${pkgver}/Makefile" -i ./mbedtls2-Makefile.patch
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make PREFIX="$pkgdir/usr" install
}
