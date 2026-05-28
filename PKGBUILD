# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Squirreljetpack
_pkgname=matchmaker
_execname=mm
_archive_suffix=cli
pkgname=${_pkgname}-bin
pkgdesc="A fast, configurable and intuitive fuzzy searcher"

pkgver=0.0.41
pkgrel=1
_pkgvername=${pkgver}

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
sha256sums=('d2d9a076f6e95ff783ad10d82b3afc17c151808f7fe66e76929874edccb2e5d9'
            'c6c69eecdd3e0972052d83ab233beeb5a11ac5fcac36a4cdf87268589fac7b33'
            'c6a01888e377a81caf5bbca8878bf91abe6ba0991f69a35f65d1e4c44e9c6cc4')
sha256sums_x86_64=('6c622581a506c3ee57a13000628db654ad435ca3fea56ee1311a4073f6999124')
sha256sums_aarch64=('c618da8d2352b6c8a1d12146c4a1d31f7b7153d3f1a994d9944273b2f8fac31e')


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
