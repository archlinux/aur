# Maintainer: Xaver Hellauer <software@hellauer.bayern>
# Contributor: Stephen Lester <stephen@lester.codes>
pkgname=wire-desktop-bin
pkgver=3.6.2885
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
# https://wire-app.wire.com/linux/debian/pool/main/wire_2.15.2751_amd64.deb
source_i686=("https://wire-app.wire.com/linux/debian/pool/main/wire_${pkgver}_i386.deb")
source_x86_64=("https://wire-app.wire.com/linux/debian/pool/main/wire_${pkgver}_amd64.deb")
sha256sums_i686=('2dd49e94e80f6c58fd615933544b6f6cff6615f7c125a8f68cbafaa89932b268')
sha256sums_x86_64=('719881099b5384b1c0f493f57fc45494991b3733cbbfe060954768de898e519f')
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
  ln -s "/opt/Wire/wire-desktop" "${path_dir}"
}
