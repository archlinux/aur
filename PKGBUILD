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
source_i686=("https://wire-app.wire.com/linux/debian/pool/main/Wire-${pkgver}_i386.deb")
source_x86_64=("https://wire-app.wire.com/linux/debian/pool/main/Wire-${pkgver}_amd64.deb")
sha256sums_i686=('2851b3c19e94dc276e119bd336fbff453b2088a6507eb28e6c24fd64b67c42d2')
sha256sums_x86_64=('3bedda4d8fb640c0f3a0f65a89258dfe788dc0e3d686db7ebe6a6ce4af4388b6')
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
  deb_package="Wire-${pkgver}_${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"

  # Add wire symlink to a directory in the $PATH
  path_dir="${pkgdir}/usr/bin"
  install -d "${path_dir}"
  ln -s "/opt/Wire/wire-desktop" "${path_dir}"
}
