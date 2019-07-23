# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=keepass-plugin-hibpofflinecheck
_pluginname=HIBPOfflineCheck
pkgver=1.6.1
pkgrel=1
pkgdesc="Keepass plugin that performs offline checks against the haveibeenpwned passwords file"
depends=('keepass')
arch=('any')
url="https://github.com/mihaifm/HIBPOfflineCheck"
source=("${_pluginname}-${pkgver}.tar.gz::https://github.com/mihaifm/${_pluginname}/archive/${pkgver}.tar.gz")
sha256sums=('2d232c276692defe150d92067b7d0b5ebb6bfac381b9c8a5d66444e6eafddb8e')

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
