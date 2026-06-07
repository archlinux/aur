# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Epistates
_gitname=gravityfile
_appname=${_gitname}
_alias=grav
pkgname=${_appname}-bin
pkgdesc="File system explorer and analyzer with an interactive TUI"

pkgver=0.2.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("${_alias}-${pkgver}.bash::${_ghurlraw}/scripts/${_alias}.bash"
		"${_alias}-${pkgver}.fish::${_ghurlraw}/scripts/${_alias}.fish"
		"${_alias}-${pkgver}.zsh::${_ghurlraw}/scripts/${_alias}.zsh"
		"LICENSE-APACHE-${pkgver}::${_ghurlraw}/LICENSE-APACHE"
		"LICENSE-MIT-${pkgver}::${_ghurlraw}/LICENSE-MIT"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"AUDIT-${pkgver}.md::${_ghurlraw}/AUDIT_FIXES.md"
		"CHANGELOG-${pkgver}.md::${_ghurlraw}/CHANGELOG.md"
		"PLUGINS-${pkgver}.md::${_ghurlraw}/docs/PLUGINS.md"
		"ARCHITECTURE-${pkgver}.md::${_ghurlraw}/docs/ARCHITECTURE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('9b9fbd3c5b3494061a29b9f78957d3f888cbf5ec4ad0859efac96435be85f03e'
            '80ee5be553b56f756dc64c81c1520c6ebdf5c8c69a043a4bc65665d79b669518'
            '033531c8d865b05008b99b76c10b89d36ba4249d9aa365ae85a621202357b2bf'
            '2795063013f0f7498d460ef22570b194db597071f9261154f1ba055c6ab60189'
            'd2fb587595a98e66310d2d3152994e6f1078b82f9e8bceab42d053e18d212f73'
            '937ebc9634f6bdebb63d93389a8841b859d4ac3d32be354747184b37095d070a'
            'd38c4097e1ecf618f40bbf854f5915a4ec0a53edfb984340ba92087d80df0e85'
            'ea24d695e74a4ed939ef1bbad00e1d9648f47aa9893acbcdbcd86330ee6411c4'
            'b3504c1fc8685fe594f0103e44d440f0a0b62990de6d4a1e31848cba90c91f8a'
            'dc5c24dec266c9db2d1563a335c26aa8e4c6adef64e5f572419f22231baa1d09')
sha256sums_x86_64=('3149bd7f3911b3ad05550ed4ecc3adde5921224c891b2c6dd2735f8dd2f6b8b9')
sha256sums_aarch64=('6e98df4f9dd282f0b9d75a4da28344b1e967cfde880abdf4ed5851aeb4de89de')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_alias}-${pkgver}.zsh" "${pkgdir}/usr/share/${_appname}/${_alias}.zsh"
	install -Dm644 "${_alias}-${pkgver}.bash" "${pkgdir}/usr/share/${_appname}/${_alias}.bash"
	install -Dm644 "${_alias}-${pkgver}.fish" "${pkgdir}/usr/share/${_appname}/${_alias}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "AUDIT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AUDIT.md"
	install -Dm644 "PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "ARCHITECTURE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

