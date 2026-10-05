# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: James Tattersall <contact at jtattersall dot net>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=autotag-bin
_pkgname=${pkgname%-bin}
pkgver=4.1.4
pkgrel=1
pkgdesc='Automatic tagging and renaming of TV show episodes and movies'
arch=('x86_64')
url='https://github.com/jamerst/AutoTag'
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=(
	"${pkgname}-${pkgver}_linux-x64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}_linux-x64.zip"
	"${pkgname}-${pkgver}_linux-x64.LICENSE::https://raw.githubusercontent.com/jamerst/AutoTag/refs/tags/v${pkgver}/LICENSE"
)
b2sums=(
	'a0d0c3d7f6d65130c06d137f2e0add14aa6b15ea2c3b0f65bef6c836c058e2d1f79e9c05d989cfe9d55249a6e4d2a7e18bcebb423b21d8d7c6779c4f4231c5df'
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
