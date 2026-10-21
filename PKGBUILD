# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=SimpleArchiver
_pkgauthor=Stephen-Seo
_pkgname=${_appname,,}
pkgname=${_pkgname}-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="An alternative to tar"

license=('ISC')
_arch_prefix='debian'
arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_${_arch_prefix}_${arch[0]}")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}_${_arch_prefix}_${arch[1]}")
sha256sums=('db7f7ce8121ec5084ef74e60e72d22f165f6d7d6664a1af5ccdbb956e1f38793'
            'c727dd01aea35b1dd5421c6f2b416f5d8f70a8ecabe6e8bf82d0381be7ff7613')
sha256sums_x86_64=('bffff96553760dd9bfa0b0e2aa811eb4910b452e6d86bc2300334fedb7f572d8')
sha256sums_aarch64=('b34ffc31a679d1e0813114803c67a28b271ae00b4af15a651f32517c94dfa709')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_${_arch_prefix}_${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
