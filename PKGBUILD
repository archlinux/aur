# Maintainer: Stephen Lester <stephen@lester.codes>
pkgname=wire-desktop-bin
pkgver=3.0.2816
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
sha256sums_i686=('b798b8e1805598a892b638f74b045f8a10bb6b7ae4ad6f334cb3a115e40148b7')
sha256sums_x86_64=('8c1e4152dd07fa497c5df4913090c126c5d19695027e28a2051b60c4c4f5fe8e')
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
