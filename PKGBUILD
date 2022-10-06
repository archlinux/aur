# Maintainer:Zaiic<zaiic@qq.com>
pkgname=shimo
_pkgname=shimo
pkgver=3.0.4
pkgrel=1
pkgdesc="石墨文档 Shimo document (An online collaborative office software)."
arch=('x86_64')
url="https://shimo.im/"
license=('custom')
depends=('nss' 'gtk3' 'libnotify' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source=(
	"https://as.smvm.cn/panther/shimo/release/linux/x64/shimo_v${pkgver}-release.98ec8bb.shimo_linux-amd64.deb"
)
sha512sums=('ccebe1e6e8be1b6292a59c21aee5b24fae8ced93e6abb4f60850af9bb74696f816368224d886a979c245963ee2a20c737c89677c552af3c2574f7827b7e62aec')

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
