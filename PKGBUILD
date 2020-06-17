# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego
pkgdesc='Maltego information gathering software by Paterva'
license=('Commercial')
url='https://maltego-downloads.s3.us-east-2.amazonaws.com/linux'
pkgver=4.2.11.13104
pkgrel=1
package=Maltego.v${pkgver}.deb
arch=('i686' 'x86_64')
depends=('java-runtime=8')

source_i686=(
  "${url}/${package}"
)
source_x86_64=(
  "${url}/${package}"
)
sha256sums_i686=(1b73b0e77add946dde39c726898be7b217afeec9f6b7b014bf28f8971a7cf3ab)
sha256sums_x86_64=(1b73b0e77add946dde39c726898be7b217afeec9f6b7b014bf28f8971a7cf3ab)
md5sums_i686=(ce45a73d7745b97fc86de33b5f74e68f)
md5sums_x86_64=(ce45a73d7745b97fc86de33b5f74e68f)

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

