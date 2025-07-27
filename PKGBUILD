# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: James Tattersall <contact at jtattersall dot net>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=autotag-bin
_pkgname=${pkgname%-bin}
pkgver=4.0.0
pkgrel=3
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
	'7d5d24ff39ba3bc7ca1f7d5d439b7fafea5e685d2c2c9f79f3237f24f902496d34d6a1f2be188c71a00c926ca755738e40e02241abbc3e7d52caaba36c70b99a'
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
