# Maintainer: Stephen Lester <stephen@lester.codes>
pkgname=wire-desktop-bin
pkgver=2.14.2744
pkgrel=2
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
# https://wire-app.wire.com/linux/wire_2.14.2744_amd64.deb
source_i686=("https://wire-app.wire.com/linux/wire_${pkgver}_i386.deb")
source_i686=("https://wire-app.wire.com/linux/wire_${pkgver}_i386.deb")
source_x86_64=("https://wire-app.wire.com/linux/wire_${pkgver}_amd64.deb")
sha256sums_i686=('5649aabb24ad8f1054b3d77a8d33b0b30e7f02f3b56ba1fe685d3eafcf89935b')
sha256sums_x86_64=('e2f10e5f2d8ea2e4e9d8db59e55a2d417d53d2b49dc68495eaeda77cf1bceb43')

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
