# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Matej Horváth <matej.horvath@gmail.com>

pkgname=gscreenshot
pkgver=1.3
pkgrel=5
pkgdesc="A GUI front-end for scrot"
arch=('i686' 'x86_64')
url="http://gscreenshot.googlecode.com/"
license=('GPL')
depends=('libglade' 'scrot' 'pygtk' 'python-imaging')
source=(http://$pkgname.googlecode.com/svn/trunk/$pkgname-$pkgver.tar.gz
        black-white_2-Style-applets-screenshooter.png $pkgname.desktop)
noextract=($pkgname-$pkgver.tar.gz)
md5sums=('9b71ff62bb1a4d30557f6af6726da10f'
         '289f9c98f97be35bc558ee5d314d3a3d'
         'edca8ec37120e6bfbb438e136f03551d')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  tar xzf $pkgname-$pkgver.tar.gz -C "$pkgdir/usr/share/$pkgname" \
    --strip=1 --transform="s,$pkgname$,$pkgdir/usr/bin/$pkgname,"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 black-white_2-Style-applets-screenshooter.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  sed -i 's,/usr/bin/env python,&2,; s,import Image,from PIL &,' \
    "$pkgdir/usr/share/$pkgname/$pkgname.py"
}

# vim:set ts=2 sw=2 et:
