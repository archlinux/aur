# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=tuxclocker
pkgver=0.1.1
pkgrel=2
pkgdesc="Qt5 GPU overclocking GUI utility."
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
license=('GPL3')
depends=('qt5-x11extras' 'nvidia-settings' 'libxnvctrl' 'nvidia-utils')
conflicts=('tuxclocker-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
"$pkgname.desktop")
md5sums=('7a6a4e669572a318d57b2096544a06b2'
'8c79ba856661ffb6815ca2e15c5e62e6')

build() {
    cd "$pkgname-$pkgver"
    qmake rojekti.pro
    make
}

package() {
    # Install the app
    install -d "$pkgdir"/opt/$pkgname/bin/
    cp -a "$pkgname-$pkgver"/tuxclocker "$pkgdir"/opt/$pkgname/bin/tuxclocker

    chmod 755 "$pkgdir"/opt/$pkgname/bin/$pkgname

    install -d "$pkgdir"/usr/bin/
    ln -s /opt/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

    # Desktop Entry
    install -d "$pkgdir"/usr/share/{pixmaps,applications}

    cp -a "$pkgname-$pkgver"/gpuonfire.svg "$pkgdir"/opt/$pkgname/$pkgname.svg
    ln -s /opt/$pkgname/$pkgname.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg

    cp -a "$srcdir"/$pkgname.desktop "$pkgdir"/opt/$pkgname
    ln -s /opt/$pkgname/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
