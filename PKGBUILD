# Maintainer: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=rest-server-bin
pkgdesc='Rest Server is a high performance HTTP server that implements restics REST backend API.'
license=('BSD')
url='https://github.com/restic/rest-server'
pkgver=0.12.1
pkgrel=1
package86=rest-server_${pkgver}_linux_386
package64=rest-server_${pkgver}_linux_amd64
packagearm=rest-server_${pkgver}_linux_armv7
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
sha256sums_i686=('e74dd099f499eaac4bfa9ff4861c2deef1b7a148ebce6a3480855c348c35dc2c')
sha256sums_x86_64=('58f886043c62b7908a1b8b684e0d2388dfaabecaf2fbcd3e0aaa5a3be2f2306f')
sha256sums_armv7h=('6fbf8f391822b90df6db99b51eb9f56be5827c71e59bfe038e541cd987d02b57')
sha256sums_aarch64=('be1f393cc6516c7decab3cfdd7fc64e80edacaa696fc7e4169eab116ed30dfa0')

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
