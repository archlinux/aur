# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel
__pkgname=DPITunnel
pkgver=1.0.0
pkgrel=1
pkgdesc="Free, simple and serverless solution against censorship for Linux PCs and routers"
arch=('x86_64')
url="https://github.com/txtsd/DPITunnel"
license=('GPL-3.0-or-later')
depends=('libnl' 'gcc-libs' 'zlib' 'openssl' 'glibc' 'brotli' 'ca-certificates-utils')
makedepends=('cpp-httplib')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "cpp-httplib-0.15.3.tar.gz::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v0.15.3.tar.gz")
sha256sums=('57126419fc1def7611cd4b37798315f316d9659f3b76f446472ab551426552a9'
            '2121bbf38871bb2aafb5f7f2b9b94705366170909f434428352187cb0216124e')

prepare() {
  cd "${__pkgname}-${pkgver}"
  cp -r "${srcdir}/cpp-httplib-0.15.3" "${srcdir}/${__pkgname}-${pkgver}"
  rm -rf cpp-httplib
  mv "cpp-httplib-0.15.3" "cpp-httplib"
}


build() {
  cd "${__pkgname}-${pkgver}"
  cmake -B build .
  cmake --build build
}

package() {
  cd "${__pkgname}-${pkgver}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
