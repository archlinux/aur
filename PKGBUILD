# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=tuxclocker-git
_pkgname=tuxclocker
pkgver=r52.90fc054
pkgrel=1
pkgdesc="Qt5 GPU overclocking GUI utility. Git version."
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
license=('GPL3')
makedepends=('git')
depends=('qt5-x11extras' 'nvidia-settings' 'libxnvctrl' 'nvidia-utils')
conflicts=('tuxclocker')
source=("git+$url.git"
'tuxclocker.desktop')
md5sums=('SKIP'
'8c79ba856661ffb6815ca2e15c5e62e6')

pkgver() {
    cd "$srcdir/tuxclocker"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/tuxclocker"
    qmake rojekti.pro
    make
}

package() {
    # Install the app
    install -d "$pkgdir"/opt/$_pkgname/bin/
    cp -a "$srcdir"/$_pkgname/$_pkgname "$pkgdir"/opt/$_pkgname/bin/$_pkgname

    chmod 755 "$pkgdir"/opt/$_pkgname/bin/$_pkgname

    install -d "$pkgdir"/usr/bin/
    ln -s /opt/$_pkgname/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname

    # Desktop Entry
    install -d "$pkgdir"/usr/share/{pixmaps,applications}

    cp -a "$srcdir"/$_pkgname/gpuonfire.svg "$pkgdir"/opt/$_pkgname/$_pkgname.svg
    ln -s /opt/$_pkgname/$_pkgname.svg "$pkgdir"/usr/share/pixmaps/$_pkgname.svg

    cp -a "$srcdir"/$_pkgname.desktop "$pkgdir"/opt/$_pkgname
    ln -s /opt/$_pkgname/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
}
