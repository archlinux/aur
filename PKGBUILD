# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=unixshells
_gitname=latch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal multiplexer with built-in remote access"

pkgver=1.0.41
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("MAN-CONF-${pkgver}.5::${_ghurlraw}/doc/${_appname}.conf.5"
		"MAN-${pkgver}.1::${_ghurlraw}/doc/${_appname}.1"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('6d186a990976f715f0ae7f1d91d2cabac123252272d25117e1cf18e1311aaea4'
            '101bdf6bcafc121c066ea3e3de53a354b400422b2d67d291e2e85c6640ee9ff6'
            '0c045728227b899634d71a3917b2651a207a998ac22d6189622f8b53e3c5b763'
            '293007430814de6eecc706aa9f929a727bd527f336ea480b656e545550d30c5b')
sha256sums_x86_64=('32a65332e979546a73ed327e15da1e0f065849a3add6939cf9cd8d9dc23220fc')
sha256sums_aarch64=('528ef81de2ec3cc799b6088c9b46398d5583bf87ca7252ebf142bb7cb28680b9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"
	install -Dm644 "MAN-CONF-${pkgver}.5" "${pkgdir}/usr/share/man/man5/${_appname}.conf.5"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
