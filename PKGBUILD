# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.6.0
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('07f28df047ba9e576316495ad53e7bd40cd44a882af1db0e254351bca05eec7f')

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
