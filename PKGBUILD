# Contributor: Gergely Imreh <imrehg@gmail.com>
# Contributor: Denis Vadimov <me@bloody.pw>

pkgname=vectr
pkgdesc='Vector graphics design app'
pkgver=0.1.16
pkgrel=1
arch=('i686' 'x86_64')
url='https://vectr.com/'
license=('custom')
depends=('gtk2' 'gdk-pixbuf2' 'alsa-lib' 'nss' 'libxtst' 'libxss' 'gconf')
makedepends=()
source=('vectr.desktop'
        'vectr.svg')
source_i686=(http://download.vectr.com/desktop/${pkgver}/linux/Vectr-${pkgver}-ia32.zip)
source_x86_64=(http://download.vectr.com/desktop/${pkgver}/linux/Vectr-${pkgver}.zip)

sha256sums=('0bf55bed71f68c0fb998d8a12da6fa6ac1f927775ebc8c11d9f754667b76d18f'
            '0b273cda8c53c94de884efb400ff1d57c75101c966db695f3622f190669e1af9')
sha256sums_i686=('53e0bd072ea96558bac30aac4fdd6b4d2744567b329f869cb556962776164f01')
sha256sums_x86_64=('48c0ad4208c11725cae941e179789e87b674c2d3de26419deb0cddc17dbe5471')

package() {
    if [ "$CARCH" = "i686" ]; then
        _source_arch="-ia32"
    fi
    _source_path="linux${_source_arch}-unpacked"

    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/${_source_path}" "${pkgdir}/opt/vectr"
    install -d "$pkgdir"/usr/bin
    ln -s ../../opt/vectr/vectr "${pkgdir}/usr/bin/vectr"

    install -Dm644 "${srcdir}/vectr.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/vectr.desktop" "$pkgdir/usr/share/applications/vectr.desktop"

    install -Dm644 "${srcdir}/${_source_path}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
