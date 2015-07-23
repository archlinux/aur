# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=shadowspdy
_npmname=shadowspdy
pkgver=0.1.8
pkgrel=1
pkgdesc="A tunnel proxy using spdy as the tunnel"
arch=("any")
url="https://github.com/clowwindy/shadowsocks-nodejs"
depends=("nodejs>=0.10.0")
license=("MIT")
backup=("usr/lib/node_modules/${_npmname}/config.json")
install=shadowspdy.install
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
        "shadowspdy.service")
sha256sums=('cef338c7faaabb57e9094043b1695d7eb99fec417f74f6a7f44e75f1e4b79730'
            'dae953e8ae694e5cce2a9ad54473eeb4395ca707cf03af21b7a3ed58c03bc0b1')
noextract=(${_npmname}-${pkgver}.tgz)

package() {
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}-${pkgver}.tgz
  cd "${pkgdir}/usr/lib/node_modules/${_npmname}"
  rm -r .idea .travis.yml package.json Cakefile src
  install -Dm644 "${srcdir}/${pkgname}.service" \
                 "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
