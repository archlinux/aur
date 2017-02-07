# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=vectr
pkgdesc='Vector graphics design app'
pkgver=0.1.12
pkgrel=1
arch=('i686' 'x86_64')
url='https://vectr.com/'
license=('custom')
depends=()
makedepends=()
source=('vectr.desktop'
        'vectr.svg')
source_i686=(http://download.vectr.com/desktop/${pkgver}/linux/Vectr-linux32.zip)
source_x86_64=(http://download.vectr.com/desktop/${pkgver}/linux/Vectr-linux64.zip)

sha256sums=('7ff45e5176094f9c397a2b917a35ae5c4948e5be0449b07f5df486981cf4174a'
            '0b273cda8c53c94de884efb400ff1d57c75101c966db695f3622f190669e1af9')
sha256sums_i686=('cad55f6da4997b648073bb04be8fb892239dee89d4943415865b1aafbba370a0')
sha256sums_x86_64=('42181ee6e8ffdaff309eae349fcf6d459fe22f49db04cf016451274a4f15cf24')

package() {
    if [ "$CARCH" = "i686" ]; then
        _source_arch="-ia32"
    fi
    _source_path="linux${_source_arch}-unpacked"

    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/${_source_path}" "${pkgdir}/opt/vectr"
    install -d "$pkgdir"/usr/bin
    ln -s ../../opt/vectr/Vectr "${pkgdir}/usr/bin/vectr"

    install -Dm644 "${srcdir}/vectr.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/vectr.desktop" "$pkgdir/usr/share/applications/vectr.desktop"

    install -Dm644 "${srcdir}/${_source_path}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
