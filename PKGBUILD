# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=lighthouse-bitcoin
pkgver=25
pkgrel=1
pkgdesc="Specialised Bitcoin wallet that uses the advanced smart contracts features of the Bitcoin protocol to provide all-or-nothing crowdfunding"
arch=('i686' 'x86_64')
url="https://www.vinumeris.com/lighthouse"
license=('APACHE')
provides=('lighthouse')
conflicts=('lighthouse-git')
source_x86_64=("https://s3-eu-west-1.amazonaws.com/vinumeris/lighthouse/lighthouse-64bit.deb")
source_i686=("https://s3-eu-west-1.amazonaws.com/vinumeris/lighthouse/lighthouse-32bit.deb")
sha256sums_x86_64=("7463ce42d2af1eea62c853cda198bc27638ed824a34924707d909b23ffe7a3ff")
sha256sums_i686=("ca3457f225d5db72580a6e9d0f2e3fadb4d5dee94a5fa5cdfc01e77fc3a554b3")
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
