# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.7.9
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('2c53f30592dfd9b07c871cb6cc14ce77a249d5b5671a434b92ad51012c8a34f2')

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
