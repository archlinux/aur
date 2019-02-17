# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego
pkgdesc='Maltego information gathering software by Paterva'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.1.13.11516
pkgrel=2
package=Maltego.v${pkgver}.deb
arch=('i686' 'x86_64')
depends=('java-runtime=8')

source_i686=(
  "${url}/malv41/${package}"
)
source_x86_64=(
  "${url}/malv41/${package}"
)
sha256sums_i686=(1c23119b81b30ff956fa48b7a590acda49a1b81b6c497c4036897042eee499aa)
sha256sums_x86_64=(1c23119b81b30ff956fa48b7a590acda49a1b81b6c497c4036897042eee499aa)
md5sums_i686=(993b9dca487509fd0bafac4620fabd83)
md5sums_x86_64=(993b9dca487509fd0bafac4620fabd83)

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

