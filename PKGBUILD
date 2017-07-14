# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nwjs
pkgver=0.23.6
pkgrel=1
pkgdesc="node-webkit is an app runtime based on Chromium and node.js"
arch=("i686" "x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk2" "nss" "ttf-font" "libxtst" "libxss")
optdepends=(
    "nodejs: npm package support"
    "nw-gyp: native add-on build tool for node-webkit"
)
source=("nwjs-nw-v${pkgver}.tar.gz::https://github.com/nwjs/nw.js/archive/nw-v${pkgver}.tar.gz"
	"node-nw-v${pkgver}.tar.gz::https://github.com/nwjs/node/archive/nw-v${pkgver}.tar.gz"
	"v8-nw-v${pkgver}.tar.gz::https://github.com/nwjs/v8/archive/nw-v${pkgver}.tar.gz")
sha512sums=("b7a03e3b09c5c439af68e728b21e500fed2eb940b25c4b0c712bb0eefbf9c7e17524fcaf13b15c2489437f1f484f45c46afe46023f2be723347f27e59ee5b431"
	    "aa0d6cf62dfd0f07b75bcfb8db30525669f13a2ee699225fc37bb13c00b3c67daa0a65d68af0b98a284cc3a31e3b5fe40ff8157b28747ae197059aaa9409148f"
	    "698fbc1924048b5043b3607b06d85cdbe295bb0fab0234ed15b89778da75dd63006662fb48371c8b7ed91a1209b42d4397e9fb06787a06addf2f17e8d4d43ce9")

build() {
  cd "${srcdir}/"
  mkdir nwjs
  cd nwjs
  gclient config --name=src https://github.com/nwjs/chromium.src.git@origin/nw17
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
