# Maintainer: Stephen Lester <stephen@lester.codes>
pkgname=wire-desktop-bin
pkgver=2.17.2813
pkgrel=2
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
# https://wire-app.wire.com/linux/debian/pool/main/wire_2.15.2751_amd64.deb
source_i686=("https://wire-app.wire.com/linux/debian/pool/main/wire_${pkgver}_i386.deb")
source_x86_64=("https://wire-app.wire.com/linux/debian/pool/main/wire_${pkgver}_amd64.deb")
sha256sums_i686=('a422714327cdc04e20ff4dc099a65806b49bf4b6ab3cff1839b6aecadb72d4de')
sha256sums_x86_64=('e1700df84c712055d02adacdb1c9b023ee30394ccb2c5fdb44a1682641844f13')
options=(!strip)

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
  deb_package="wire_${pkgver}_${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"

  # Add wire symlink to a directory in the $PATH
  path_dir="${pkgdir}/usr/bin"
  install -d "${path_dir}"
  ln -s "/opt/wire-desktop/wire-desktop" "${path_dir}"
}
