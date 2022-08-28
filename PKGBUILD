# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.7.8
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('50e8c8c2e0d56281c10e6e1f09e0852a38c9cd821e7bc08b279e03fb38529411')

prepare() {
	cd "${srcdir}/${_pluginname}-${pkgver}/${_pluginname}"
	mkdir ../build
	cp -r Properties Resources *.cs *.resx *.csproj ../build/
}

build() {
	keepass --plgx-create "${srcdir}/${_pluginname}-${pkgver}/build"
}

package() {
	install -Dm644 "${srcdir}/${_pluginname}-${pkgver}/build.plgx" "${pkgdir}/usr/share/keepass/Plugins/${_pluginname}.plgx"
}
