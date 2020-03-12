# Maintainer: Lone_Wolf <lonewolf@klaas-de-kat.nl>
# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgbase=seventhsense
pkgname=seventhsense
pkgver=1.17.0
pkgrel=2
pkgdesc="Lone wolf book player"
arch=('i686' 'x86_64')
url='http://www.projectaon.org/staff/david/index.php'
license=('custom')
depends=('curl' 'sdl_ttf' 'sdl_image' 'physfs')
source=("SeventhSenseSource-$pkgver.zip::https://www.projectaon.org/staff/david/Seventh%20Sense%20Source.zip"
        'seventhsense.desktop'
        'seventhsense.launcher')
md5sums=('3ce121358547a050ca5a50a6f0b88792'
         '6f144bfbf5110f5a237e6817d2972f47'
         '7ca36fe278b206e7ce57cfd5914776fd')

build() {
# Create Destination Directory
  cd SeventhSense-$pkgver
  make
}

package() {
  cd SeventhSense-"$pkgver"
  # Install the data
  install -d "$pkgdir/opt/$pkgname/data"
  cp -r data/* "$pkgdir/opt/$pkgname/data/"
  install -m755 LoneWolf "$pkgdir/opt/$pkgname/LoneWolf"
  install -m644 README.txt "$pkgdir/opt/$pkgname/README.txt"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  # Install Icon
  install -D -m 644 data/icons/wm.png "$pkgdir/usr/share/pixmaps/seventhsense.png"
  # Install Launcher
  install -D -m 644 ../seventhsense.desktop "$pkgdir/usr/share/applications/seventhsense.desktop"
  # Install Game Launcher
  install -D -m 755 ../seventhsense.launcher "$pkgdir/usr/bin/seventhsense"
}
