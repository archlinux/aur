# Maintainer: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>
pkgname=pseint
pkgver=20210609
pkgrel=1
pkgdesc="A tool for learning programming basis with a simple spanish pseudocode"
comment="Educational tool to learn the fundamentals and development of programming logic"
arch=('x86_64')
url='http://pseint.sourceforge.net'
license=('GPL2')
conflicts=('pseint-bin')
depends=('gendesk' 'wxwidgets-gtk3')
noextract=(creator.psz)
source=("$pkgname-$pkgver.tar.gz::https://cfhcable.dl.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-l64-${pkgver}.tgz")
sha256sums=('a5df4e147c529e3da509b30dee02791642c32cb3b5bbbc6cd3cd7594f10cb9f4')  # 'makepkg -g' para generarlo.

prepare(){
    gendesk -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --name="${pkgname}" \
        --genericname="${pkgname}" \
        --comment="${comment}" \
        --exec="${pkgname}" \
        --path="/opt/${pkgname}" \
        --icon="${pkgname}" \
        --categories='Development,Education'
}

package(){
    install -Dvm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dvm644 "${srcdir}/${pkgname}/imgs/icon.icns" "${pkgdir}/usr/share/pixmaps/${pkgname}.icns"
    install -Dvm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    cp -r ${srcdir}/${pkgname}/ ${pkgdir}/opt/
}

## Test:
# rm -rf pseint-{20210609.tar.gz,l64-20210609.tgz,20210609-1.src.tar.gz} src/ pkg/
## References

# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=densify
# https://wiki.archlinux.org/title/Desktop_entries#How_to_use
# https://sourceforge.net/projects/pseint/files/
# https://sourceforge.net/projects/pseint/files/20210609/pseint-l64-20210609.tgz/download
