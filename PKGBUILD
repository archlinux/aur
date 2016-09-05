# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=vectr
pkgdesc='Vector graphics design app'
pkgver=0.1.10
pkgrel=1
arch=('i686' 'x86_64')
url='https://vectr.com/'
license=('custom')
depends=()
makedepends=()
source=('vectr.desktop'
        'vectr.svg')
source_i686=(http://download.vectr.com/desktop/Vectr-linux-ia32-${pkgver}.zip)
source_x86_64=(http://download.vectr.com/desktop/Vectr-linux-x64-${pkgver}.zip)

sha256sums=('7ff45e5176094f9c397a2b917a35ae5c4948e5be0449b07f5df486981cf4174a'
            '0b273cda8c53c94de884efb400ff1d57c75101c966db695f3622f190669e1af9')
sha256sums_i686=('2fd966d000a948ff39e107f8c702f8c13a1f6c6f10b1311c7d22e8564279831e')
sha256sums_x86_64=('1eea23a3359c47d9b2446c219ea1160b60fd8541703a4eb4d581f45a4eee47d7')

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
