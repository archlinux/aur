# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=clifm-bin
_pkgname="${pkgname%-bin}"
pkgver=1.10
pkgrel=1
pkgdesc="The command line file manager (binary version)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/leo-arch/clifm"
license=(GPL2)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libcap' 'readline' 'acl' 'file')
makedepends=('make' 'gzip')
optdepends=(
	'archivemount: Archives mount'
	'atool: Archives/compression support'
	'p7zip: ISO 9660 support'
	'cdrtools: ISO 9660 support'
	'fzf: fzf mode for TAB completion'
	'smenu: smenu mode for TAB completion'
	'udevil: (un)mount storage devices'
	'udisks2: (un)mount storage devices'
	)
source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")
source_i686=("${_pkgname}-${pkgver}-linux-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-i686.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-linux-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7h.tar.gz")
sha256sums_x86_64=('38ebcf10bd04478c6dccab2c98b47673947f3bb96e9ab8302f262f7caaaad324')
sha256sums_i686=('e92b9ddb959aab804a4c02aa6325bb5624cc4d90241349273735bb225da3b17f')
sha256sums_armv7h=('ee3c414088693bc2aa2c35dea7b7088f92cb8379a36e956ba9293dcb56a9f0df')

package() {
	install -Dm 0755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -m 0755 -d "${pkgdir}/usr/share/${_pkgname}"
	cp -r --preserve=mode -- files/* "${pkgdir}/usr/share/${_pkgname}"
	install -m 0755 -d "${pkgdir}/usr/share/bash-completion/completions"
	install -m 0755 -d "${pkgdir}/usr/share/zsh/site-functions"
	install -m 0755 -d "${pkgdir}/usr/share/applications"
	install -m 0755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -m 0755 -d "${pkgdir}/usr/share/man/man1"
	install -m 0644 completions.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -m 0644 completions.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -m 0644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications"
	install -m 0644 ${_pkgname}.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -m 0644 ${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1"
}
