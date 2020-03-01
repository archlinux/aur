# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=miro-video-converter
pkgver=3.0.2
pkgrel=6
pkgdesc='Simple video converter for MP4, WebM (vp8) and Ogg Theora'
url="https://github.com/pculture/${pkgname//-/}3"
license=('GPL3')
arch=('any')
depends=('python2>=2.7.0' 'ffmpeg' 'hicolor-icon-theme' 'pygtk' 'gnome-icon-theme')
makedepends=('python2-distribute')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pculture/${pkgname//-/}3/archive/v$pkgver.tar.gz")
sha256sums=('3c564cf88e6264f206b9c0cef136809805412f92e536b5407f5d64c1c4dd9970')

package() {
   cd "${pkgname//-/}3-$pkgver"

   python2 setup.py install --root="$pkgdir" --optimize=1

   # Fix Desktop file
   sed -i 's|Media player||' "$pkgdir/usr/share/applications/${pkgname//-/}.desktop"

   # Remove unneeded stuff
   rm -rf "$pkgdir/usr/lib/python2.7/site-packages/mvc/"{osx,windows,widgets/osx}
}
