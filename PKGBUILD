# Maintainer: OGIOS <ogios@foxmail.com>

pkgname=cptserv-cli
pkgver=4
pkgrel=1
pkgdesc="Cross platform data synchronization"
arch=("x86_64" 'aarch64')
url="https://github.com/CPTServ/TCli"
license=("GPL3")
makedepends=('go')
_tarname=tcli_linux64
_exename=transfer_client
_linkedname=tcli
provides=($_linkedname)
source=("${url}/releases/download/v${pkgver}/${_tarname}.tar.gz")
sha256sums=("SKIP")
options=(!debug)

build() {
  tar -zxf ${_tarname}.tar.gz
}

package() {
  # make sure directories exist for cp and ln...
  install -d "${pkgdir}/usr/lib/" "${pkgdir}/usr/bin/"

  cp -r "build/linux/x64/release/bundle" "${pkgdir}/usr/lib/${pkgname}"

  chmod +x "${pkgdir}/usr/lib/${pkgname}/${_exename}"

  ln -s "${pkgdir}/usr/lib/${pkgname}/${_exename}" "${pkgdir}/usr/bin/${_linkedname}"
}
