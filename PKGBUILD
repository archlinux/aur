# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=clifm-bin
_pkgname=clifm
pkgver=1.28
pkgrel=1
pkgdesc="The command line file manager (binary version)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/leo-arch/${_pkgname}"
license=(GPL-2.0-or-later)
provides=('clifm')
conflicts=('clifm' 'clifm-git' 'clifm-nerd')
depends=('libcap' 'readline' 'acl' 'file')
makedepends=('make' 'gzip')
optdepends=(
	'archivemount: Archives mount'
	'atool: Archives/compression support'
	'p7zip: ISO 9660 support'
	'cdrtools: ISO 9660 support'
	'fzf: fzf mode for tab completion'
	'fnf: fnf mode for tab completion'
	'smenu: smenu mode for tab completion'
	'udevil: (un)mount storage devices'
	'udisks2: (un)mount storage devices'
	)

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('80be580f67d9da178a2f0d56e1ebf2812f947b49bd36790ff5f55232bfa14347')

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
