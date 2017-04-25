# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.13.2741
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
# https://wire-app.wire.com/linux/wire_2.13.2739_amd64.deb
source_i686=("https://wire-app.wire.com/linux/wire_${pkgver}_i386.deb")
source_i686=("https://wire-app.wire.com/linux/wire_${pkgver}_i386.deb")
source_x86_64=("https://wire-app.wire.com/linux/wire_${pkgver}_amd64.deb")
sha256sums_i686=('f2cd5d6db4c51d5673fd6153217bdeca3c49ae1492a017e854d27f0dfdfc7d2b')
sha256sums_x86_64=('fa17278b9c9ebd9b66464b5230dc9c1187e7c7b34050ac5b2a756725d6836d8f')

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
