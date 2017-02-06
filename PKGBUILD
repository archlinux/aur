# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2705
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_i686=("https://wire-app.wire.com/linux/wire_${pkgver}_i386.deb")
source_x86_64=("https://wire-app.wire.com/linux/wire_${pkgver}_amd64.deb")
sha256sums_i686=('fa43db2e458db40218f1101c97d0197901e8985b6fa87fc1c7df7c2c20d023a0')
sha256sums_x86_64=('d5ff8a80373fec928563e24cd45e97196855c131ee9588e29b9c405a6a71e595')

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
  ln -s "/opt/Wire/wire" "${path_dir}"
}
