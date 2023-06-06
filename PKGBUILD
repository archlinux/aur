# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="apifox-bin"
pkgver=2.2.42
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://apifox.com/"
license=('custom')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
providers=("${pkgname%-bin}")
depends=('gtk3' 'lib32-gcc-libs' 'nodejs' 'nss' 'at-spi2-core' 'java-runtime' 'alsa-lib' 'libxdamage' 'expat' 'cairo' 'libx11' 'dbus' \
  'nspr' 'libxrandr' 'lib32-glibc' 'libxext' 'gcc-libs' 'libxcomposite' 'libxcb' 'glib2' 'libcups' 'libdrm' 'glibc' 'libxkbcommon' \
  'libxfixes' 'hicolor-icon-theme' 'pango' 'mesa' 'sh')
options=(!strip)
source=("${pkgname%-bin}-deb-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-deb-latest.zip"
  "LICENSE.html::${url}/help/app/faq/")
sha256sums=('1d93e8a9778a5fe4716d3d7fa6518f9c169e17fefbc1b88d6415c042507ed034'
            'ced0a381df47fff43afde7e40be9cba87798e27807d4cf989ee4c111a284c5a3')
   
package() {
    ar -x "${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -r "${pkgdir}/opt/Apifox/resources/app/node_modules/sshpk/man" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/ajv/scripts/info" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/oas-validator/node_modules/ajv/scripts/info"
}