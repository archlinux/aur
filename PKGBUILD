# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=oxyzenQ
_gitname=zelynic
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Per-app network rate limiter and traffic monitor for Linux. Pure eBPF. Boring and silent but killer."

pkgver=80.2.0
pkgrel=1
_gitversion=v${pkgver}

_cpu=v3
_libc=musl
arch=('x86_64')
_barch=("linux-amd64-${_cpu}-${_libc}")

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-only')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'bash')

options=('!strip')

source=("USAGE-${pkgver}.md::${_ghurlraw}/docs/USAGE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('7357e276a5c464c018dfd215d4f12318cc9aa94d9e285e335064b69995da0220')
sha256sums_x86_64=('0fd4d965125211722a59931b9a7654e8f3fe1a6e4b366e54c44ccd58762b6d11')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
