# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=vectr
pkgdesc='Vector graphics design app'
pkgver=0.1.16
pkgrel=1
arch=('i686' 'x86_64')
url='https://vectr.com/'
license=('custom')
depends=()
makedepends=()
source=('vectr.desktop'
        'vectr.svg')
source_i686=(http://download.vectr.com/desktop/${pkgver}/linux/Vectr-${pkgver}-ia32.zip)
source_x86_64=(http://download.vectr.com/desktop/${pkgver}/linux/Vectr-${pkgver}.zip)

sha256sums=('7ff45e5176094f9c397a2b917a35ae5c4948e5be0449b07f5df486981cf4174a'
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
