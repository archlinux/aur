# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=coinffeine
pkgver=0.9.0
pkgrel=1
pkgdesc="Coinffeine is an open source, peer-to-peer (P2P) bitcoin exchange platform"
arch=('i686' 'x86_64')
url="http://coinffeine.com/"
license=('custom')
provides=('coinffeine')
source=("LICENSE")
source_x86_64=("https://s3-eu-west-1.amazonaws.com/coinffeine-releases/v${pkgver}/coinffeine-${pkgver}_linux64.deb")
source_i686=("https://s3-eu-west-1.amazonaws.com/coinffeine-releases/v${pkgver}/coinffeine-${pkgver}_linux32.deb")
sha256sums=('eb488d0f731d3d4977e7c46b3934ca9c26ab27b73b40c22074054fc37a85010f')
sha256sums_i686=('40caab28e175b9e9de24907f5d72ea198f6fbc63d9f56812e48d447b271433d4')
sha256sums_x86_64=('728b484d1bc16e808888aa44693ed98fd343ce04a74529a78279a3f8fb69dabd')
_binname=Coinffeine

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/$pkgname}

  # Install all .deb files into /opt.
  cp -r "$srcdir/opt" "$pkgdir"

  # Copy LICENSE. 
  cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Symlink some files to complete install.
  ln -s "/opt/$_binname/$_binname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/opt/$_binname/${_binname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  ln -s "/opt/$_binname/${_binname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
