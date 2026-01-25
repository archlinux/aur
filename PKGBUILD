# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Husen <hi@husen.id>

_pkgauthor=wfxr
_pkgname=code-minimap
pkgname=${_pkgname}-bin
pkgdesc="High performance code minimap render"

pkgver=0.6.8
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT' 'Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${arch[1]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${arch[2]}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('887d0e5b53cdadb47f9a6a973aae9806adf236780b77fb98d87b98bd65585c5c')
sha256sums_i686=('84941ba0c516f6bda41911d08aef563c86b82684c757bb1740f845b5768da5d3')
sha256sums_aarch64=('31f671335d1e0775f69d13d14a6579c4a13ba847834a4a6e987c44f907bc0f23')


package() {
	cd "${srcdir}/${_pkgname}-${_pkgvername}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "completions/bash/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 "completions/fish/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 "completions/zsh/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE-"{MIT,APACHE} -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
