# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=vectr
pkgdesc='Vector graphics design app'
pkgver=0.1.9
pkgrel=1
arch=('x86_64')
url='https://vectr.com/'
license=('custom')
depends=()
makedepends=()
source=('vectr.desktop'
        'vectr.svg')
source_x86_64=(http://download.vectr.com/desktop/Vectr-linux-x64-${pkgver}.zip)
sha256sums=('7ff45e5176094f9c397a2b917a35ae5c4948e5be0449b07f5df486981cf4174a'
            '0b273cda8c53c94de884efb400ff1d57c75101c966db695f3622f190669e1af9')
sha256sums_x86_64=('85b1320b8dedf6442ec5599323fe92dde55bccc58cffd75455f287ca4b9a27b6')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        _source_arch="x64"
    fi
    _source_path="Vectr-linux-${_source_arch}"

    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/${_source_path}" "${pkgdir}/opt/vectr"
    install -d "$pkgdir"/usr/bin
    ln -s ../../opt/vectr/Vectr "${pkgdir}/usr/bin/vectr"

    install -Dm644 "${srcdir}/vectr.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/vectr.desktop" "$pkgdir/usr/share/applications/vectr.desktop"

    install -Dm644 "${srcdir}/${_source_path}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
