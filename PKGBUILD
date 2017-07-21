# Maintainer: Stephen Lester <stephen@lester.codes>
pkgname=wire-desktop-bin
pkgver=2.15.2751
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
sha256sums_i686=('6ad4c8dc1b443a473be82b7c998dcafb7019f1ec1ebc1e489cfc411525cddd0c')
sha256sums_x86_64=('10dc23f64dedb5e30b275a6c5455118a4f510be837f546a841cbb2ec71be68e3')
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
