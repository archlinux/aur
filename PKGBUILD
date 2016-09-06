# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=miro-video-converter
pkgver=3.0.2
pkgrel=5
pkgdesc='Simple video converter for MP4, WebM (vp8) and Ogg Theora'
url="https://github.com/pculture/${pkgname//-/}3"
license=('GPL3')
arch=('any')
depends=('python2>=2.7.0' 'ffmpeg' 'hicolor-icon-theme' 'pygtk')
makedepends=('python2-distribute')
install=$pkgname.install
source=("https://github.com/pculture/${pkgname//-/}3/archive/v$pkgver.tar.gz"
        $pkgname.install)
sha256sums=('3c564cf88e6264f206b9c0cef136809805412f92e536b5407f5d64c1c4dd9970'
            '3213bd620408c400a904ed989d21be94f8afaa6f3b20981f0fe09fafe29d9678')

package() {
   cd "${pkgname//-/}3-$pkgver"

   python2 setup.py install --root="$pkgdir" --optimize=1

   # Fix Desktop file
   sed -i 's|Media player||' "$pkgdir/usr/share/applications/${pkgname//-/}.desktop"

   # Remove unneeded stuff
   rm -rf "$pkgdir/usr/lib/python2.7/site-packages/mvc/"{osx,windows,widgets/osx}
}
