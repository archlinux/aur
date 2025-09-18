# Maintainer: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=rest-server-bin
pkgdesc='Rest Server is a high performance HTTP server that implements restics REST backend API.'
license=('BSD')
url='https://github.com/restic/rest-server'
pkgver=0.14.0
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
sha256sums_i686=('de12ba817a8153be2ba4cbe6ae51ad2ca4c26d8210084659c1f421839bdb49c7')
sha256sums_x86_64=('4c9c95bc079a0334e81fad379b19dc5c3353c71c2c88d652cafce2081c2b1c66')
sha256sums_armv7h=('1b01b6a98b59d68ae8cf472189a92c2c17d0a49f8a3542fc986ea7a921e55742')
sha256sums_aarch64=('cef139cbe8b27b16bda731d17f093b0aa466b8c60b136c12d78b6f2bff3daf22')

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
