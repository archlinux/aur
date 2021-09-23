# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|tr -d '[0-9]'

pkgname=ares
pkgver=2.5.7.3083
pkgrel=2
pkgdesc="A free open source file sharing program that enables users to share any digital file including images, audio, video, software, documents, etc. (via wine)"
arch=(i686 x86_64)
url="https://aresgalaxy.io/"
license=('GPL')
depends=('wine')
makedepends=(p7zip)
_version=257
_filename="aresregular"$_version"_installer.exe"
source=(ares.sh ares.desktop ares.xpm https://aresgalaxy.io/$_filename)
sha256sums=('bfa8650a5c9192fe8ebc2cdf8ddefa3dbf7b95f003a5b0c233c6b820ca10489d'
            'dc5552f166262247a26baa93549428f4a376ceea420b04ba9292d2986c8b040a'
            '408e8e672aaf8024757aa09c1609543d671d5ce88028ed45bf351008db051724'
            '7b069f605fe679ebc5fd1d0133db4158ae2269d9a297e20ed50bf6862c152a0d')

noextract=()
options=(!strip)

build() {
  cd $srcdir/
  7z x -o$pkgname $_filename
}

package() {
  cd $srcdir/

  install -dm755 $pkgdir/usr/share/
  cp -R $pkgname $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 "{}" \;
  install -dm755 $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/share/applications
  install -dm755 $pkgdir/usr/share/pixmaps

  install -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -m644 $pkgname.desktop $pkgdir/usr/share/applications
  install -m644 $pkgname.xpm $pkgdir/usr/share/pixmaps
}
