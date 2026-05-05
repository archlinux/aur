# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=roberte777
_gitname=zesh
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Zellij session manager with zoxide integration"

pkgver=0.3.0
pkgrel=1
_gitversion=${_appname}-v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

depends=('glibc' 'libgcc' 'zellij' 'zoxide')
optdepends=('git: enable zesh clone command')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('05836120cd293f7070b0520daea00462c190ede1e8a952419382543a22d2c590'
            'd9c3774a02d90c15b5afb8440f6c9dbfb964914755d9d63fa31c570b01221762')
sha256sums_x86_64=('2d4112a54938171c0adc47296505c3c306d014e10b964dd1f5776d767a5e4e1f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
