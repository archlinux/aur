# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=2.0.30
pkgrel=1
pkgdesc="Official Dida client, a todo list."
arch=("any")
url="https://dida365.com/home"
license=("BSD")
_electron=electron19
depends=(${_electron})
optdepends=('noto-fonts-emoji: for emoji support')
provides=(${_pkgname})
source=("${_pkgname}_${pkgver}.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb"
    "${_pkgname}".sh
)
sha512sums=('f2c32ac427e8e7e257a61871e5705b416da9148bb7ceb8f457afcbdf1e68031241b2e0e6a3aa56a89aa559fa6309096b34cf8f5d6154832aa4cb7fa17ef196ab'
            '218ff1e8c89d1567c214d0fec91745606ab48077bb24168a2b18b28f9c69a6918d34c38fe6a70e8aeaee3b6df448e7174c343924e6fa875ba1a583cc656c91ba')

prepare() {
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cp -f opt/*/resources/app.asar ${_pkgname}.asar
    sed -i "s|__ELECTRON__|${_electron}|g" dida.sh
    cd usr/share/applications
    sed -i 's|^Exec=.*|Exec=dida %U|g' dida.desktop
}

package() {
    cd ${srcdir}
    mv usr ${pkgdir}
    install -Dm644 ${_pkgname}.asar -t ${pkgdir}/usr/share/${_pkgname}
    install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}
