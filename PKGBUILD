# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=profullstack
_gitname=mynaposter
_appname=myna
pkgname=${_gitname}-bin
pkgdesc="A terminal social media manager. Log in, write, schedule and post to 25 networks from one TUI"

pkgver=0.11.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("PLUGINS-${pkgver}.md::${_ghurlraw}/docs/plugins.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('720ac00dba2225d90ab5203815084f3d251575f3d23386de06017b2411b62e2c'
            'e8797a13717f033a05d8d45331c4eca20451bdaa50f62e8d9f3da2ff79313f71'
            'de1b680e8cf8ebf3641646e14f5c0730f726da2d9d6d211d498032c20d0d9e2c')
sha256sums_x86_64=('b4f75f85dede90fe8334166dbe321143b151c7ee8914d3ceb80b1c2a010df7ef')
sha256sums_aarch64=('5d5fbf2edb48b29ab42ad527f5fe41d0c875fa35cce947eb94d315adac3988bf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
