# Maintainer:Zaiic<zaiic@qq.com>
pkgname=shimo
_pkgname=shimo
pkgver=3.1.1
pkgrel=1
pkgdesc="石墨文档 Shimo document (An online collaborative office software)."
arch=('x86_64')
url="https://shimo.im/"
license=('custom')
depends=('nss' 'gtk3' 'libnotify' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source=(
	"https://as.smvm.cn/panther/shimo/release/linux/x64/shimo_v${pkgver}-release.6d78b4a.shimo_linux-amd64.deb"
)
sha512sums=('26f762f241dff008a90cbb7952b9bc2c10487a8d1b05fee1551fd028eeaa09d19b0ff7df094ceb0c04c18a0bd5bc096ac0e6cc9a6b1c127fe8c18de2710ab626')

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
