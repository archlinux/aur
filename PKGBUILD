# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=2.0.10
pkgrel=2
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
sha512sums=('01da569d84de8b1885cd086b6c8e6806e94f055ce5a4f15edcce30e11715f1a3f4716f28f601be540d62d3889fd1bb6804db97bbb39c24ecbb44c2b6029fc8d6'
            '218ff1e8c89d1567c214d0fec91745606ab48077bb24168a2b18b28f9c69a6918d34c38fe6a70e8aeaee3b6df448e7174c343924e6fa875ba1a583cc656c91ba')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cp -f  opt/*/resources/app.asar ${_pkgname}.asar
    sed -i "s|__ELECTRON__|${_electron}|g" dida.sh
    cd usr/share/applications
    sed -i 's|^Exec=.*|Exec=dida %U|g' dida.desktop
}

package(){
    cd ${srcdir}
    mv usr ${pkgdir}
    install -Dm644 ${_pkgname}.asar -t ${pkgdir}/usr/share/${_pkgname}
    install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}
