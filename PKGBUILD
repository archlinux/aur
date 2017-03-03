# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.12.2729
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_i686=("https://github.com/wireapp/wire-desktop/releases/download/release%2F${pkgver}/wire_${pkgver}_i386.deb")
source_x86_64=("https://github.com/wireapp/wire-desktop/releases/download/release%2F${pkgver}/wire_${pkgver}_amd64.deb")
sha256sums_i686=('81320169bf04a4cea01f8c848fe3d43bd379bb2241480f7793b3a53e2438d314')
sha256sums_x86_64=('72cf4a2a50164a3c19cf2e3bbb76b6ecdffaa12f9309e4179ea1369c27f0a1cf')

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
