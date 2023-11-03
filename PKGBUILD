# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: zoe <chp321 [at] gmail (dot) com>

pkgname=jexiftoolgui
pkgver=2.0.2
pkgrel=1
pkgdesc="Graphical frontend for the excellent command-line ExifTool by Phil Harvey"
arch=('any')
url="https://github.com/hvdwolf/jExifToolGUI"
license=("GPL3")
depends=('dcraw' 'java-runtime>=11' 'perl-image-exiftool')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.deb")
sha256sums=('56d5db97ede460e235a1567d12270be9852669b8528babaf71880f329c1be402')

prepare() {
  tar -xf data.tar.xz
  sed -i "s/share\/$pkgname\//share\/icons\/hicolor\/48x48\/apps\//g" usr/share/applications/$pkgname.desktop
}

package() {
  cd usr
  install -D -m755 bin/$pkgname -t "$pkgdir/usr/bin"
  cd share
  install -D -m644 applications/$pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -D -m644 doc/$pkgname/copyright -t "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 doc/$pkgname/changelog.gz -t "$pkgdir/usr/share/doc/$pkgname"
  install -D -m644 $pkgname/jExifToolGUI.jar $pkgname/logback.xml -t "$pkgdir/usr/share/$pkgname"
  install -D -m644 $pkgname/$pkgname-48x48.png -t "$pkgdir/usr/share/icons/hicolor/48x48/apps"
}
