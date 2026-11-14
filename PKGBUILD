# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=feraxhp
_gitname=grp
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A command line tool that helps you manage your git repositories in the cloud, for difrent platforms"

pkgver=0.16.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'zlib' 'openssl-3')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENCE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${arch[0]}-${_gitversion}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${arch[1]}-${_gitversion}")
sha256sums=('da09903a36b757673a7f782bf140289fea2347a6567f3232e03134c5c858a5b2'
            'e0e60b9f84143eabd420c6fbd7864bfb909d3eabcf14aa923086a76cb8cfd448')
sha256sums_x86_64=('664506bf2bb291f9925d270ce43ef77924e2d1365dd4272b1cc97b5a4be2cf84')
sha256sums_aarch64=('0bd2ca53a41e0e0b3e89e51c6f4316a03338ea381debea722d427e293f460235')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
