# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

pkgname=android-simg2img
pkgver=1.1.4
pkgrel=3
# pkgdesc="standalone simg-tools"
pkgdesc="tool to convert Android sparse images to raw images (anestisb standalone fork)"
arch=($CARCH)
url=https://github.com/anestisb/$pkgname
license=(Apache)
depends=(gcc-libs zlib)
optdepends=('python2: run simg_dump.py')
# community/android-tools has started to provide append2simg img2simg simg2img
conflicts=(simg-tools android-tools)
source=($pkgname-$pkgver.tar.gz::https://github.com/anestisb/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(cbd32490c1e29d9025601b81089b5aec1707cb62020dfcecd8747af4fde6fecd)

# Meld - File - Format as Patch... - Copy to Clipboard
# xclip -o -selection clipboard | sed -i -e '/^BLOB1/{r /dev/stdin' -e 'd;}' PKGBUILD
prepare() {
patch --verbose $pkgname-$pkgver/simg_dump.py<<EOP
--- simg_dump.py
+++ simg_dump.py
@@ -1,4 +1,4 @@
-#! /usr/bin/env python
+#! /usr/bin/env python2
 
 # Copyright (C) 2012 The Android Open Source Project
 #
EOP
}

# "make package" always build everything from the very beginning
# build() {
# 	cd "$pkgname-$pkgver"
#   make PREFIX="$pkgdir/usr" all
# }

package() {
	cd $pkgname-$pkgver
  make PREFIX="$pkgdir/usr" install
  chmod -v 644 "$pkgdir/usr/lib/libsparse.a"
  install -vDm755 simg_dump.py "$pkgdir/usr/bin/"
}
