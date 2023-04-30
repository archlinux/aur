# Maintainer: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=rest-server-bin
pkgdesc='Rest Server is a high performance HTTP server that implements restics REST backend API.'
license=('BSD')
url='https://github.com/restic/rest-server'
pkgver=0.12.0
pkgrel=1
package86=rest-server_${pkgver}_linux_386
package64=rest-server_${pkgver}_linux_amd64
packagearm=rest-server_${pkgver}_linux_armv7
arch=('i686' 'x86_64' 'armv7h')
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
sha256sums_i686=('8af6a5251acfe00b5d4e610a2487c541b6b708b9c01d25aa36d32045c90c1736')
sha256sums_x86_64=('4008e3cc1b651e378c439deaf13676a9a4c5abd07748490ffef8d6ad5ef90ce8')
sha256sums_armv7h=('bba4460e6445362afe0e6d734f32dc97e27dbc0838d97e6d52785cc8ee12c658')

package() {
  if [ "$CARCH" = "i686" ] ; then
    package=${package86}
  elif [ "$CARCH" = "x86_64" ] ; then
    package=${package64}
  elif [ "$CARCH" = "armv7h" ] ; then
    package=${packagearm}
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
