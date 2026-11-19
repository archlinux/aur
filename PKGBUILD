# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Squirreljetpack
_pkgname=matchmaker
_execname=mm
_archive_suffix=cli
pkgname=${_pkgname}-bin
pkgdesc="A fast, configurable and intuitive fuzzy searcher"

pkgver=0.1.8
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
sha256sums=('ae62cdeba47fbe0194d5e6939fcec897b53e8c1c7024f3ae228183d453b7e6df'
            '90dba9be38f61f781329a9800186334a4ca039d02ceaca7f1a3a50641f464c0f'
            '5feaf950695fbfafb6fc963fb0bacae18d96a0ae52b29bc2206841b67791df0d')
sha256sums_x86_64=('fd5695775be77eb4ddcb9c51be5f47e9fc87219f60e282b374c16e6cad4a5d32')
sha256sums_aarch64=('8ade9025f881ef5f26d658438391aa83495b58fa8c565aff0320d702ab5adbb9')


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
