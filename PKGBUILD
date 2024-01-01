# Maintainer: Corey Powell (mistdragon100@gmail.com)
# This is based off the tagged releases in the official hashlink repo
# So if you want official releases, this is the PKGBUILD for you.
pkgname=hashlink
pkgver=1.14
pkgrel=1
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
sha256sums=('7def473c8fa620011c7359dc36524246c83d0b6a25d495d421750ecb7182cc99'
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
