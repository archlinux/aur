# Maintainer:levinit <levinit at outlook dot com>  https://github.com/levinit/aur-pkgbuilds
# Ex-Maintainer: end222 <pabloorduna98 at gmail dot com>
# Ex-maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-megasync"
pkgver="3.6.6"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from nautilus."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('libnautilus-extension' 'megasync>=2.9.8' 'qt4')
provides=("${pkgname}")

source=("https://mega.nz/linux/MEGAsync/Debian_9.0/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('SKIP')

install="${pkgname}.install"

build() {
	cd "${pkgname}-${pkgver}"
    qmake-qt4 MEGAShellExtNautilus.pro
    make
}

package() {
	cd "${pkgname}-${pkgver}"
    install -dm 755 ${pkgdir}/usr/lib/nautilus/extensions-3.0/
    install -m 755 -p libMEGAShellExtNautilus.so.1.0.0 ${pkgdir}/usr/lib/nautilus/extensions-3.0/

    cd "data/emblems"
    for size in 32x32 64x64
    do
        install -dm 755 ${pkgdir}/usr/share/icons/hicolor/${size}/emblems
        install -m 644 -p ${size}/mega-{pending,synced,syncing,upload}.{icon,png} ${pkgdir}/usr/share/icons/hicolor/${size}/emblems/
    done

    cd "${pkgdir}/usr/lib/nautilus/extensions-3.0"
    ln -f -s libMEGAShellExtNautilus.so.1.0.0 libMEGAShellExtNautilus.so.1.0
    ln -f -s libMEGAShellExtNautilus.so.1.0.0 libMEGAShellExtNautilus.so.1
    ln -f -s libMEGAShellExtNautilus.so.1.0.0 libMEGAShellExtNautilus.so
}

# vim:set ts=4 sw=2 ft=sh et:
