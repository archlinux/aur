# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=lighthouse-bitcoin
pkgver=25
pkgrel=1
pkgdesc="Specialised Bitcoin wallet that uses the advanced smart contracts features of the Bitcoin protocol to provide all-or-nothing crowdfunding"
arch=('i686' 'x86_64')
url="https://www.vinumeris.com/lighthouse"
license=('APACHE')
conflicts=('lighthouse-git')
source_x86_64=("https://s3-eu-west-1.amazonaws.com/vinumeris/lighthouse/lighthouse-64bit.deb")
source_i686=("https://s3-eu-west-1.amazonaws.com/vinumeris/lighthouse/lighthouse-32bit.deb")
md5sums_i686=('1be86a9dd0c9e6ddd501a8faf8719caa')
md5sums_x86_64=('0f2c633c72dab8ffc2e052fa9fae3249')
_binname=lighthouse

prepare() {
  tar -Jxvf data.tar.xz
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps}

  # Install all .deb files into /opt.
  cp -r "$srcdir/opt" "$pkgdir"

  # Symlink some files to complete install.
  ln -s "/opt/$_binname/$_binname" "$pkgdir/usr/bin/$_binname"
  ln -s "/opt/$_binname/${_binname}.desktop" "${pkgdir}/usr/share/applications/${_binname}.desktop"
  ln -s "/opt/$_binname/${_binname}.png" "${pkgdir}/usr/share/pixmaps/${_binname}.png"
}
