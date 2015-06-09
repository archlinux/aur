# Maintainer: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgbase=seventhsense
pkgname=seventhsense
pkgver=1.16.1
pkgrel=1
pkgdesc="Lone wolf book player"
arch=('i686' 'x86_64')
url='http://www.projectaon.org/staff/david/index.php'
license=('custom')
depends=('curl' 'sdl_ttf' 'sdl_image' 'physfs')
source=('SeventhSenseSource.zip::http://www.projectaon.org/staff/david/click/click.php?id=4'
        'seventhsense.desktop'
        'seventhsense.launcher')
md5sums=('52208e4aa29c8f6b787fe98388cbfe15'
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
