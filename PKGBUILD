# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=coinffeine
pkgver=0.10.1
pkgrel=1
pkgdesc="Coinffeine is an open source, peer-to-peer (P2P) bitcoin exchange platform"
arch=('i686' 'x86_64')
url="http://coinffeine.com/"
license=('custom')
source=("LICENSE")
source_x86_64=("https://s3-eu-west-1.amazonaws.com/coinffeine-releases/v${pkgver}/coinffeine-${pkgver}_linux64.deb")
source_i686=("https://s3-eu-west-1.amazonaws.com/coinffeine-releases/v${pkgver}/coinffeine-${pkgver}_linux32.deb")
sha256sums=('eb488d0f731d3d4977e7c46b3934ca9c26ab27b73b40c22074054fc37a85010f')
sha256sums_i686=('9a1f6a165dd8d061b968cc5fd69f3bf51ac8634b9ef8060b20952e5bdf2ed222')
sha256sums_x86_64=('b1c40d2f49fe8aa40a4f7d9a47ce652e9433359907a70d831773f7fa819feb53')
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
