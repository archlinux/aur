# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=playitslowly
pkgver=1.4.0
pkgrel=4
pkgdesc="Software to play back audio files at a different speed or pitch. It does also allow you to loop over a certain part of a file."
arch=('i686' 'x86_64')
url=http://29a.ch/$pkgname
license=(GPL3)
depends=(pygtk gstreamer0.10-python gstreamer0.10-base-plugins gstreamer0.10-good-plugins gstreamer0.10-bad-plugins gstreamer0.10-ugly-plugins hicolor-icon-theme)
install=$pkgname.install
source=($url/$pkgname-$pkgver.tar.gz)
sha256sums=('5c7ec0b1bf82c9b95ab8a86e8f123b9106d7836d8cd21a66c4f996b9ba791fb6')
sha512sums=('510ded6c986b7c9d6845f837799b5276922b70ce65648b462540040b49efbfd09d56071566ffc64ff0bcd438396db484be5b995d9c0b3bba6edac7578a5b5c4d')

prepare() {
    cd $pkgname-$pkgver/
    sed -ri 's:python\b:&2:' $pkgname/app.py bin/$pkgname
}

build() {
    cd $pkgname-$pkgver/
    python2 setup.py build
}

package() {
    cd $pkgname-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 -t $pkgdir/usr/share/icons/hicolor/32x32/apps share/icons/hicolor/32x32/${pkgname}.png
    install -Dm644 -t $pkgdir/usr/share/icons/hicolor/scalable/apps share/icons/hicolor/scalable/${pkgname}.svg
    install -Dm644 -t $pkgdir/usr/share/pixmaps share/pixmaps/${pkgname}.png
    install -Dm644 -t $pkgdir/usr/share/applications share/applications/${pkgname}.desktop
    install -Dm644  -t ${pkgdir}/usr/share/docs/${pkgname} README
    install -Dm644  COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}