# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Squirreljetpack
_pkgname=matchmaker
_execname=mm
_archive_suffix=cli
pkgname=${_pkgname}-bin
pkgdesc="A fast, configurable and intuitive fuzzy searcher"

pkgver=0.1.7
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
sha256sums=('ae1c44f41348eb4f0c541a041418f99918d631ebfc52755f4f69f62a15f259d3'
            '998ad899f8a50344a69f11c05eaf46881f7ed76a60d92b3da19bd333b33f5124'
            '6c6bf4bef7bbca3c48b16d8e4a6bb43bdab25cefc8da24446f3a80ea4d786b46')
sha256sums_x86_64=('c0036d9e3ca8d1de40b8a67efedc80f031170c005e81474b228c39eb0f971114')
sha256sums_aarch64=('4c7dc483946d2b35c0bbe8aca8e637af552d1f00764c16197e7380c74fcd458c')


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
