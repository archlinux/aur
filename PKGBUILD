# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=clitic
_gitname=ffpb-rs
_appname=${_gitname%%-rs}
pkgname=${_gitname}-bin
pkgdesc="A modern, cli progress bar for ffmpeg"

pkgver=0.2.1
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

depends=('ffmpeg')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-MIT-${pkgver}::${_ghurlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_ghurlraw}/LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.xz")
sha256sums=('69d995b51c1c573279fd2fcff1dbbb4ba1f8a0148e4cfe62d215cce898a8afd0'
            '3b2582ab8cba78cef5e619034cafea64f544bbd1e2b88b64c0a9f001feb2c170'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('6c0e9f7ebd34de3fdc1b75060c0ec5248d0d5aa75a750832ae730589d31d89ab')
sha256sums_aarch64=('01744cf2b445c8855e993dcda9d1b5c76ef95756ed60162a0d508d3fe15fb0f6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
