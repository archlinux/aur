# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: James Tattersall <contact at jtattersall dot net>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=autotag-bin
_pkgname=${pkgname%-bin}
pkgver=4.0.1
pkgrel=1
pkgdesc='Automatic tagging and renaming of TV show episodes and movies'
arch=('x86_64')
url='https://github.com/jamerst/AutoTag'
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=(
	"${pkgname}-${pkgver}_linux-x64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}_linux-x64.zip"
	"${pkgname}-${pkgver}_linux-x64.LICENSE::https://raw.githubusercontent.com/jamerst/AutoTag/refs/tags/v${pkgver}/LICENSE"
)
b2sums=(
	'4e372fa35cdbc3d983c31cf0a25a4a510dc313b5fbe41e344cd5615b5460311ec33c27eef95494863ba0caa3666bef2bb9d7bcae7094b88018bf618ad0a1e7e3'
	'd07bd39d4a2fb2574463c9f3b17e4b9075e8e5169a19d7499a0ed12e91b24075f6e33eba723b57019e43e261b8abb21d89b1e2f156c1d7170e4605e545302d10'
)

prepare() {
	unzip "${pkgname}-${pkgver}_linux-x64.zip" -d "${pkgname}-${pkgver}"
	mv "${pkgname}-${pkgver}_linux-x64.LICENSE" "${pkgname}-${pkgver}/LICENSE"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin" "${_pkgname}"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
