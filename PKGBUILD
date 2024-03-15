# Maintainer:mistgc <georgecai0908@outlook.com>
pkgname=shimo
_pkgname=shimo
pkgver=3.3.1
pkgrel=1
pkgdesc="石墨文档 Shimo document (An online collaborative office software)."
arch=('x86_64')
url="https://shimo.im/"
license=('custom')
depends=('nss' 'gtk3' 'libnotify' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source=(
	"https://oas.shimonote.com/panther/shimo/release/linux/x64/shimo_v${pkgver}-release.ea23524.shimo_linux-amd64.deb"
)
sha512sums=('8ea8a82a17d8128e4ed7421bb42e194421264ff630c9d3f648cb85796f7dfe3b2e83f58873bff704345abcbbad87e610455db352c8b8ef7aa55ddcee5b78af16')

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
