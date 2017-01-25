# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=playitslowly
pkgver=1.5.1
pkgrel=3
pkgdesc="Software to play back audio files at a different speed or pitch. It does also allow you to loop over a certain part of a file."
arch=('i686' 'x86_64')
url=http://29a.ch/$pkgname
license=(GPL3)
depends=(python-gobject gtk3 gstreamer gst-python gst-libav gst-plugins-good gst-plugins-bad gst-plugins-ugly hicolor-icon-theme)
install=$pkgname.install
source=($url/$pkgname-$pkgver.tar.gz)
sha256sums=('7dfe3da5417971183a13002d1e4ba4f30770baaf1ae3f9ef0ac66a6727f476aa')

prepare() {
    cd $pkgname-$pkgver/
    sed -i 's/mygtk/myGtk/g' $pkgname/pipeline.py
}

build() {
    cd $pkgname-$pkgver/
    python3 setup.py build
}

package() {
    cd $pkgname-$pkgver/
    python3 setup.py install --prefix=/usr --root="$pkgdir"
    chmod -R o+r $pkgdir$(python3 -c "import site; print(site.getsitepackages()[0])")/$pkgname
    install -Dm644 -t $pkgdir/usr/share/icons/hicolor/32x32/apps share/icons/hicolor/32x32/${pkgname}.png
    install -Dm644 -t $pkgdir/usr/share/icons/hicolor/scalable/apps share/icons/hicolor/scalable/${pkgname}.svg
    install -Dm644 -t $pkgdir/usr/share/pixmaps share/pixmaps/${pkgname}.png
    install -Dm644 -t $pkgdir/usr/share/applications share/applications/${pkgname}.desktop
    install -Dm644 -t ${pkgdir}/usr/share/docs/${pkgname} README
    install -Dm644 -t ${pkgdir}/usr/share/docs/${pkgname} CHANGELOG
    install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
