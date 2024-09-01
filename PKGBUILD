# Maintainer: OMGeeky <fb@omgeeky.de>

pkgname="lumafly-git"
pkgver=3.2.0.0.r7.g0687288
pkgrel=2
pkgdesc="A cross platform mod manager for Hollow Knight Formerly known as Scarab+"
conflicts=('lumafly')
arch=("x86_64")
makedepends=('dotnet-sdk-7.0' 'git')
depends=('fontconfig' 'gcc-libs' 'glibc')
license=("GPL-3.0-only")
source=("git+https://github.com/TheMulhima/Lumafly.git")
url='https://themulhima.github.io/Lumafly/'
sha512sums=("SKIP")
options=('!strip')

pkgver() {
	cd "${srcdir}/Lumafly"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd "${srcdir}/Lumafly/Lumafly"
	dotnet publish --configuration Release --os linux -p:PublishSingleFile=true --self-contained true --output "${srcdir}/publish"
}

package() {
	mkdir -p "$pkgdir"/usr/lib
	mkdir -p "$pkgdir"/usr/bin
	cp -dr --no-preserve='ownership' "${srcdir}/publish" "${pkgdir}/usr/lib/lumafly"

	ln -s /usr/lib/lumafly/Lumafly "${pkgdir}/usr/bin/lumafly"
}
