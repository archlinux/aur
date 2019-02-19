# Maintainer: Jeff Henson <jeff at henson dot io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.4.1
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('08d4f82c4445affcdfd935870f56756e6fe02fb5d609ef25882ec65ce12dc567')

prepare() {
  cd "${srcdir}/${_pluginname}-${pkgver}"
  mkdir build
  cp -r Properties Resources *.cs *.resx *.csproj *.sln build/
}

build() {
  keepass --plgx-create "${srcdir}/${_pluginname}-${pkgver}/build"
}

package() {
  install -Dm644 "${srcdir}/${_pluginname}-${pkgver}/build.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
