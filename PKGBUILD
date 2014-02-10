# Maintainer: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2
pkgver=2.0.7
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2")'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.srb2.org'
depends=('sdl_mixer' 'libpng12' 'srb2-data=2.0.6') # data has not been updated
conflicts=("srb2-bin")
makedepends=('subversion' 'mesa' 'glu')
[ "$CARCH" == "i686" ] && makedepends=(${makedepends[@]} 'nasm')
source=(srb2-$pkgver::"svn://code.srb2.org/SRB2/tags/SRB2v$pkgver"
        "srb2.bashcomp"
        "srb2.desktop"
        "srb2-opengl.desktop")
sha256sums=('SKIP'
            'e84d777fbed2acc50c36bbd93e4ad867877fb2bd31ee1af57e9b52f440a406f0'
            'ac9fa63f29ad9413797da8c6f0a4f76fa6f4dd0710d1e84a457a8c42cf6df4f9'
            'f696bab390d2b1028bf2f5c5d4d838c0981dc211cec4c4a8f349b7ec0580e701')

build() {
  cd srb2-$pkgver/src

  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  # build with system libpng12 and do not upx binary
  make LINUX$IS64BIT=1 PNG_CONFIG=libpng12-config NOUPX=1
}

package() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 srb2-$pkgver/bin/Linux$IS64BIT/Release/lsdlsrb2 "$pkgdir"/usr/bin/srb2
  install -Dm644 srb2.desktop "$pkgdir"/usr/share/applications/srb2.desktop
  install -m644 srb2-opengl.desktop "$pkgdir"/usr/share/applications
  #install -Dm644 srb2.bashcomp "$pkgdir"/usr/share/bash-completion/completions/srb2
}
