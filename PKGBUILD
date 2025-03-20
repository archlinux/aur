# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=6.0.30
pkgrel=1
pkgdesc="Official Dida client, a todo list."
arch=("any")
url="https://dida365.com/home"
license=("LicenseRef-Proprietary")
_electron=electron34
depends=(${_electron})
optdepends=('noto-fonts-emoji: for emoji support')
provides=(${_pkgname})
source=("${_pkgname}_${pkgver}.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb"
    "${_pkgname}".sh
)
sha512sums=('f9663dfbf8b0c2dfda0893f7f959c7390087ab4fd9570964b71fe10539d9a3bff895ebe7c28eea3294eed78faa552902c5fd7f547359bec240cc0d1e23b3e167'
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
