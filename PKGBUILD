# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.7.11
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('f23f6883dac734b75f7a2ef7a050e00cadf1c330e8b0b2411531ae78cd2bce67')

prepare() {
	cd "${srcdir}/${_pluginname}-${pkgver}/${_pluginname}"
	mkdir ../build
	cp -r Properties Resources *.cs *.resx *.csproj ../build/
}

build() {
	keepass --plgx-create "${srcdir}/${_pluginname}-${pkgver}/build"
}

package() {
	install -Dm644 "${srcdir}/${_pluginname}-${pkgver}/build.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
