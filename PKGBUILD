# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego
pkgdesc='Maltego information gathering software by Paterva'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.2.3.12223
pkgrel=1
package=Maltego.v${pkgver}.deb
arch=('i686' 'x86_64')
depends=('java-runtime=8')

source_i686=(
  "${url}/malv423/${package}"
)
source_x86_64=(
  "${url}/malv423/${package}"
)
sha256sums_i686=(747eaf663524f016546c7e1c8790124ff91b7f6d6a07442403c9d607f588f786)
sha256sums_x86_64=(747eaf663524f016546c7e1c8790124ff91b7f6d6a07442403c9d607f588f786)
md5sums_i686=(245b66a4cca83f5e19348679407cf201)
md5sums_x86_64=(245b66a4cca83f5e19348679407cf201)

install=maltego.install

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  #deb_package="MaltegoCE.v${pkgver}.deb"
  ar xf "$package"
  tar xf data.tar.gz -C "$pkgdir"
  # Packagaers left DS_Store files, so we have to remove
  rm -rf "$pkgdir"/{,usr/{,share/{,maltego/}}}.DS_Store
  #rm -rf $pkgdir/.DS_Store
}

