# Maintainer:Zaiic<zaiic@qq.com>
pkgname=shimo
_pkgname=shimo
pkgver=3.2.0
pkgrel=1
pkgdesc="石墨文档 Shimo document (An online collaborative office software)."
arch=('x86_64')
url="https://shimo.im/"
license=('custom')
depends=('nss' 'gtk3' 'libnotify' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source=(
	"https://oas.shimonote.com/panther/shimo/release/linux/x64/shimo_v${pkgver}-release.32738d1.shimo_linux-amd64.deb"
)
sha512sums=('74b8c4bef2c385874075a89a08aa5286adceb32d4ea614365849138d0454445a086523fcbf3a4645dfdcb1d7b4e91c838335d49b0f7b0a494bd5ca0f7f521403')

prepare() {
    tar -xpf data.tar.gz -C ${srcdir}
}

package() {
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/opt
    cd ${srcdir}
    cp -r usr ${pkgdir}
    cd ${srcdir}/opt
    cp -r ${_pkgname} ${pkgdir}/opt/${_pkgname}
    ln -s "${pkgdir}/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/opt/shimo/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
    install -Dm644 "${srcdir}/opt/shimo/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
