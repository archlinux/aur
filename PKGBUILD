# Maintainer: Andreas Baumann <mail at andreasbaumann dot cc>
# Contributor: Robin Broda <robin at broda dot me>

pkgname=hq
pkgver=3.2
pkgrel=4
pkgdesc='HTML processor inspired by jq'
arch=('x86_64')
url='https://github.com/coderobe/hq'
license=('AGPL3')
depends=('gcc-libs' 'modest')
makedepends=('git' 'meson' 'fmt')
source=("git+${url}#tag=${pkgver}"
        "fmt-format.patch")
md5sums=('bc7723c7afba3a853dd0883a52105297'
         'be43ff71abad31b97434638b586d83b6')

prepare() {
	cd "${pkgname}"

	patch -Np1 < "${srcdir}/fmt-format.patch"
}

build() {
	cd "${pkgname}"

	arch-meson build
	ninja -C build
}

package() {
	cd "${pkgname}"

	install -Dm755 "build/hq" "${pkgdir}/usr/bin/hq"
}
