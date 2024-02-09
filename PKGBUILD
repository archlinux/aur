# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=clifm-bin
_pkgname="${pkgname%-bin}"
pkgver=1.17
pkgrel=1
pkgdesc="The command line file manager (binary version)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/leo-arch/${_pkgname}"
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
#source_i686=("${_pkgname}-${pkgver}-linux-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-i686.tar.gz")
#source_armv7h=("${_pkgname}-${pkgver}-linux-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7h.tar.gz")
sha256sums_x86_64=('a93c582bcd0c69e30833612cc6844fc04540addfc9de1404c81418d2ab11cbef')
#sha256sums_i686=('13e06aae37ff7b0d611b0d56f3a053095c7585424185c696a9960760f7920ef6')
#sha256sums_armv7h=('ba1946d76f8a75164cc4398910e877ce698e54781c65173586114003125c8f0a')

package() {
	install -Dm 0755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -m 0755 -d "${pkgdir}/usr/share/${_pkgname}"
	cp -r --preserve=mode -- files/* "${pkgdir}/usr/share/${_pkgname}"
	install -m 0755 -d "${pkgdir}/usr/share/bash-completion/completions"
	install -m 0755 -d "${pkgdir}/usr/share/zsh/site-functions"
	install -m 0755 -d "${pkgdir}/usr/share/fish/vendor_completions.d"
	install -m 0755 -d "${pkgdir}/usr/share/applications"
	install -m 0755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -m 0755 -d "${pkgdir}/usr/share/man/man1"
	install -m 0644 completions.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -m 0644 completions.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -m 0644 completions.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -m 0644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications"
	install -m 0644 ${_pkgname}.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -m 0644 ${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1"
}
