# Maintainer: allddd <allddd (at) proton (dot) me>

pkgname=betterlockscreen
pkgver=4.4.0
pkgrel=1
pkgdesc='A simple, minimal lockscreen'
arch=('any')
url='https://github.com/betterlockscreen/betterlockscreen'
license=('MIT')
depends=(
    'bash'
    'bc'
    'imagemagick' 
    'xorg-xrdb'
    'xorg-xset'
    'xorg-xrandr'
    'xorg-xdpyinfo'
    'i3lock-color>=2.13.c.3'
)
optdepends=(
    'feh: for wallpaper-functionality'
)
provides=('betterlockscreen')
conflicts=('betterlockscreen')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'systemd-service.patch')
sha256sums=('fdcf58725f0ab56e98ce9b83bd1dad6e1f08c7f9f230c3abaf4191f10ebd5dfd'
            '08aa35af71cabd2e821ebb5e8bdf6e56ff4b0b3f70fe7af74d6a51aced7c35f1')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i ../systemd-service.patch
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 betterlockscreen -t "${pkgdir}/usr/bin/"
    install -Dm644 system/betterlockscreen@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 examples/betterlockscreenrc -t "${pkgdir}/usr/share/doc/${pkgname}/examples/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=4 sw=4 et:
