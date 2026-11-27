# Maintainer: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=rest-server-bin
pkgdesc='Rest Server is a high performance HTTP server that implements restics REST backend API.'
license=('BSD')
url='https://github.com/restic/rest-server'
pkgver=0.15.0
pkgrel=1
package86=rest-server_${pkgver}_linux_386
package64=rest-server_${pkgver}_linux_amd64
packagearm=rest-server_${pkgver}_linux_armv7
packageaarch64=rest-server_${pkgver}_linux_aarch64
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
options=(!strip)
source_i686=(
  "${url}/releases/download/v${pkgver}/rest-server_${pkgver}_linux_386.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/rest-server_${pkgver}_linux_amd64.tar.gz"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/rest-server_${pkgver}_linux_armv7.tar.gz"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/rest-server_${pkgver}_linux_arm64.tar.gz"
)
sha256sums_i686=('d796d4252c71bf71f82e64c264ec7d2c93a88fcae6d1bba1e07e97e39e3a2665')
sha256sums_x86_64=('822e3d7211077305ec358a8c6548ef46307ae53f71bc6a4a6da72ac53e35e007')
sha256sums_armv7h=('df98f24ee92952f0a3cc84ce3e0f1e37548d6480e0d7c92557279f2461d607d5')
sha256sums_aarch64=('1ed250ee1cc6229ca0d22085616292233d9714d4820bf5e4c37e1b29fc4de8ea')

package() {
  if [ "$CARCH" = "i686" ] ; then
    package=${package86}
  elif [ "$CARCH" = "x86_64" ] ; then
    package=${package64}
  elif [ "$CARCH" = "armv7h" ] ; then
    package=${packagearm}
  elif [ "$CARCH" = "aarch64" ] ; then
    package=${packageaarch64}
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi


  cd "$package"
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  mkdir -p "$pkgdir/usr/bin/"
  install -m755 rest-server "$pkgdir"/usr/bin/
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
