# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.7.10
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('74d2ad770936ef0bcdd5621c469b6dea74143f4a0ee59b4eb343f6342eabfe43')

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
