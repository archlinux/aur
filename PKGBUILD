# Maintainer: alstruit <alsturit at gmail.com>
pkgname=projectorrays
_pkgnamePascal=ProjectorRays
pkgver=0.2.0
pkgrel=4
pkgdesc="A decompiler for Adobe (formerly Macromedia) Shockwave and Director."
arch=('x86_64')
url="https://github.com/ProjectorRays/ProjectorRays"
license=('MPL-2.0')
depends=('zlib' 'mpg123')
makedepends=('boost>=1.72.0' 'vim')
conflicts=('projectorrays-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProjectorRays/ProjectorRays/archive/v${pkgver}.tar.gz")
sha256sums=('67231d618fe5647c41f9c592f6f9c4e4d949527787694fb151ebf1d82dfcc4b2')

prepare() {
	cd "$_pkgnamePascal-$pkgver"
	#Suppress Git error message.
	sed -i 's/^GIT_SHA=.*//' Makefile
}

build() {
	cd "$_pkgnamePascal-$pkgver"
	make release
}

package() {
	cd "$_pkgnamePascal-$pkgver"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
