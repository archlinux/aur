# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|tr -d '[0-9]'

pkgname=ares
pkgver=2.5.2.3078
pkgrel=1
pkgdesc="A free open source file sharing program that enables users to share any digital file including images, audio, video, software, documents, etc. (via wine)"
arch=(i686 x86_64)
url="https://web.archive.org/web/20190515175058/https://aresgalaxy.io/"
license=('GPL')
depends=('wine')
makedepends=(p7zip)
_version=252
_filename="aresregular"$_version"_installer.exe"
source=(ares.sh ares.desktop ares.xpm https://web.archive.org/web/20190501072741if_/https://aresgalaxy.io/$_filename)
md5sums=('c7bc3239f0a3f6e001942823f882bdcb'
         '752293e683546937e2258b0b22406c10'
         'f89b51f21633e02c9017222b33544c1b'
         '9ff5736e1626e8bf51fb70c3bb3bffc2')

noextract=()
options=(!strip)

build() {
  cd $srcdir/
  7z x -o$pkgname $_filename
}
package() {
  cd $srcdir/

  install -d -m755 $pkgdir/usr/share/
  cp -R $pkgname $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 "{}" \;
  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps

  install -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -m644 $pkgname.desktop $pkgdir/usr/share/applications
  install -m644 $pkgname.xpm $pkgdir/usr/share/pixmaps
}

