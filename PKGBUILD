# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2
pkgver=2.1.6
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2")'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.srb2.org'
depends=('sdl_mixer' 'libpng12' "srb2-data=$pkgver")
makedepends=('subversion' 'mesa' 'glu')
[ "$CARCH" == "i686" ] && makedepends+=('nasm')
source=("https://github.com/STJr/SRB2/archive/SRB2_release_$pkgver.zip"
        "srb2.bashcomp")
sha256sums=('16e17fc60e46b64e0360d091dde43442a90ee9f6f79ff7e623a24537d06b5029'
            'e84d777fbed2acc50c36bbd93e4ad867877fb2bd31ee1af57e9b52f440a406f0')

build() {
  cd SRB2-SRB2_release_$pkgver/src

  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  # build with system libpng12 and do not upx binary
  make LINUX$IS64BIT=1 PNG_CONFIG=libpng12-config NOUPX=1
}

package() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 SRB2-SRB2_release_$pkgver/bin/Linux$IS64BIT/Release/lsdlsrb2 \
    "$pkgdir"/usr/bin/srb2
  #install -Dm644 srb2.bashcomp "$pkgdir"/usr/share/bash-completion/completions/srb2
}
