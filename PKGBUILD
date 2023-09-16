# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=unidbg-fetch-qsign
_version=1.2.1
pkgver="${_version}"
pkgrel=1
pkgdesc='获取QQSign通过Unidbg'
arch=('any')
url='https://github.com/fuqiuluo/unidbg-fetch-qsign'
license=('GPL3')
depends=('java-runtime>=8' 'sh')
makedepends=('java-environment>=8')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha512sums=('47fcd7fde9f8322c00fbe8713d02f329e55cced28e4e8c7fbfcdb78fe549f95bd5229a4252c0ff76003d08dbea56791dcee0fab852498b189279a243436f11b9'
            '58ad99a40219bc692566d51b2124dde6385289905b1f25e462a109730c4515cf4bb9d02f1a66cc867892550a3d00c8346745a6d7509b992303044f0db547a55d')

build() {
  cd "${pkgname}-${pkgver}"
  ./gradlew --no-daemon assemble
}

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${pkgname}-${pkgver}"
  install -Dm644 "build/libs/${pkgname}-${_version}-all.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}
