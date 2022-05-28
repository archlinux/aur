# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.7.7
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('a6e6c2f47b8a3351f3f9081feca3e71ae4276494c76766e3c884248c2a3d9960')

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
