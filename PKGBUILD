# Maintainer: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=rest-server-bin
pkgdesc='Rest Server is a high performance HTTP server that implements restics REST backend API.'
license=('BSD')
url='https://github.com/restic/rest-server'
pkgver=0.11.0
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
sha256sums_i686=('a0c48c605d45cf63d8730b3ec44b9367df8d17cdf01b09554041aec288c9044d')
sha256sums_x86_64=('398f9ab2195a774e5a8ec8a3d733f9e56b7912f264160894072061225e8c1073')
sha256sums_armv7h=('5f6b12a4b3845c87871fecc5ddeeb19bdee8219b66cabadba67c47ea4c0d1160')

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
