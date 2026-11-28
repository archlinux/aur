# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Squirreljetpack
_pkgname=matchmaker
_execname=mm
_archive_suffix=cli
pkgname=${_pkgname}-bin
pkgdesc="A fast, configurable and intuitive fuzzy searcher"

pkgver=0.2.0
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
sha256sums=('cd3bce9ea4203857df2ae6230cfb8167958deb33da0c1143cbc6aa2d2198d86b'
            '3b8d16373a6cff0f012fef7213b72d0417816b89b32ddf990936d276b640663c'
            'de1498f0bbc93466da8b116bd40c52c76c19fd26b40fc073891a123682cb41b6')
sha256sums_x86_64=('bcac3710ffe881e56eca0725710313b193347143769dd9148dccce53e08b60be')
sha256sums_aarch64=('24fe7e64482daab18d091dcec9de767143a7fc490ef18875490b8492aff93fe8')


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
