# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Squirreljetpack
_pkgname=matchmaker
_execname=mm
_archive_suffix=cli
pkgname=${_pkgname}-bin
pkgdesc="A fast, configurable and intuitive fuzzy searcher"

pkgver=0.1.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL-3.0')

provides=("${_execname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("COMPLETION-${pkgver}.zsh::${_urlraw}/${_pkgname}-${_archive_suffix}/assets/completions/_${_execname}"
		"COMPLETION-${pkgver}.bash::${_urlraw}/${_pkgname}-${_archive_suffix}/assets/completions/${_execname}.bash"
		"COMPLETION-${pkgver}.fish::${_urlraw}/${_pkgname}-${_archive_suffix}/assets/completions/${_execname}.fish")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_archive_suffix}-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_archive_suffix}-${_barch[1]}.tar.xz")
sha256sums=('ec44cc03ddcbf18a0aa39351e28e80b7e79bd48f543c43d19449a36640336c42'
            'e5d1517dba39ad17a436a4023960d66031cb2f16a079668689af3e5e1865d8dd'
            '0f6748d2b88c10060cb3ded751f1c25b7a7f34cb8bee0b8ff475dd754950fb22')
sha256sums_x86_64=('62ab133f769b3f33e710a7140240090b1c50b6bc28895314833ac8dba649ed08')
sha256sums_aarch64=('6ec3d22f496b5829869e9658c65a6490763d786ff1f9b30d8e526018d755bf40')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_pkgname}-${_archive_suffix}-${_CARCH}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "../COMPLETION-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_execname}"
	install -Dm644 "../COMPLETION-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_execname}"
	install -Dm644 "../COMPLETION-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_execname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
