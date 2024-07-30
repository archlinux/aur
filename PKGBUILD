# Maintainer: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=rest-server-bin
pkgdesc='Rest Server is a high performance HTTP server that implements restics REST backend API.'
license=('BSD')
url='https://github.com/restic/rest-server'
pkgver=0.13.0
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
sha256sums_i686=('ba987ed5308ca263cb7ffe8ecf8aae108bef96a96a682bba437040cd8ab4f1e5')
sha256sums_x86_64=('b7f357628a2cf9bdbce56a44b0ae7125de79b72af55b232a5c1aec3f732f3a49')
sha256sums_armv7h=('4b7fc3f7a51281b20c580278315f37d83aeb7f76924830da37a26b245efa52df')
sha256sums_aarch64=('21b19d1d96de99ee6e02af5da6418c8e8559a4a81850916108b184b926d2c6fd')

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
