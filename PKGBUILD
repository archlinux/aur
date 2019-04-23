# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.5.0
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('aa6bc02ef12fd20252c263877875e80ea57a1035207df5aaa2fc1f9572dfc642')

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
