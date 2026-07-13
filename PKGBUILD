# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=westpoint-io
_gitname=lazyrsync
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for rsync — profiles, dry-run diff preview, live progress"

pkgver=0.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'rsync')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('37e135e20b3b738aaa0b3331e35fd480f3384c0417ece3791690374df773f874'
            'd5f42f4a131789a11fd12133dda988199ef9f49bc10180761a72921937219d48')
sha256sums_x86_64=('b669c4c368d04599c2973a8e362c89ea74f263d34ec80ac13aff8ba3101a3dd4')
sha256sums_aarch64=('af16a16fa88437d718200655518fcb329397011dd590a06c1a13ce7894cb12cf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
