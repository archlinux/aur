# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=coinffeine
pkgver=0.8.1
pkgrel=1
pkgdesc="Coinffeine is an open source, peer-to-peer (P2P) bitcoin exchange platform"
arch=('i686' 'x86_64')
url="http://coinffeine.com/"
license=('custom')
provides=('coinffeine')
source=("LICENSE")
source_x86_64=("https://s3-eu-west-1.amazonaws.com/coinffeine-releases/v0.8.1/coinffeine-0.8.1_linux64.deb")
source_i686=("https://s3-eu-west-1.amazonaws.com/coinffeine-releases/v0.8.1/coinffeine-0.8.1_linux32.deb")
sha256sums=("eb488d0f731d3d4977e7c46b3934ca9c26ab27b73b40c22074054fc37a85010f")
sha256sums_x86_64=("9ed2a225634e33506a2e2e71b40bcc13fadc3204553b458417966c697d7f16dc")
sha256sums_i686=("93c94e44e6d2d7c9a24d2bad2fdd719023f2774ec66765081bdf2abcfd81d442")
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
