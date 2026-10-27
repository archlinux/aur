# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kunchenguid
_pkgname=treehouse
pkgname=${_pkgname}-bin
pkgdesc="Manage worktrees without managing worktrees"

pkgver=3.1.7
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

depends=('git')

source=("CONFIG_EXAMPLE-${pkgver}.toml::${_urlraw}/${_pkgname}.toml.example"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('811b74cf1c876d42efffa54b5465dae2c617ed36d946920eb936315a5c7149f1'
            'a8c9db782956161f8e7073b690d4befe02c4ed129fc4cc9950fb31b161e1e6bd'
            '1b962d20f826f6a758c737f8aa4e8e76dc719b8aa78fcfacdfb46681bb36c2f4')
sha256sums_x86_64=('664fa870f3887c8b944c40818539143259bab4f6f0d690550d9fc6a4b8b3a6ee')
sha256sums_aarch64=('2dbdab9aff255d198c5aac3e91b77b7d426cd4d8e027b3d956c1d92afeffe732')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "CONFIG_EXAMPLE-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config/${_pkgname}.example.toml"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
