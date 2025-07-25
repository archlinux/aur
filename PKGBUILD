# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: James Tattersall <contact at jtattersall dot net>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=autotag-bin
_pkgname=${pkgname%-bin}
pkgver=4.0.0
pkgrel=1
pkgdesc="Automatic tagging and renaming of TV show episodes and movies"
arch=('x86_64')
url="https://github.com/jamerst/AutoTag"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"${pkgname}-${pkgver}_linux-x64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}_linux-x64.zip"
	"${pkgname}-${pkgver}_linux-x64.LICENSE::${url}/blob/v${pkgver}/LICENSE"
)
b2sums=(
	'7d5d24ff39ba3bc7ca1f7d5d439b7fafea5e685d2c2c9f79f3237f24f902496d34d6a1f2be188c71a00c926ca755738e40e02241abbc3e7d52caaba36c70b99a'
	'edb75d05452af997be487e2ddf455dc4fb3ac9610106bb41fc78580490ce5436c7a991d3df9aa4402207e81a0a2287434fcda35f2567d9406a1bc0dd97be123d'
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
