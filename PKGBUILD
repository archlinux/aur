# Maintainer: Christian Meter <cmeter@gmail.com>

pkgname=omnia
pkgver=0.2.1
pkgrel=1
pkgdesc="Omnia is a Clojure REPL with almost all the power of a fully fledged editor, without being an editor"
arch=('x86_64' 'armv7h')
url="https://github.com/AvramRobert/omnia"
license=('APL')
provides=('omnia')
conflicts=('omnia')
depends=('java-runtime')

source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar")
md5sums=('5d263ed854ab411a3172e644fa9c08c4')

prepare() {
  cat << EOT >| start_omnia.sh
#!/bin/sh
sh /opt/omnia/omnia
EOT
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.jar" "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.jar"
  install -D "${srcdir}/${pkgname}-${pkgver}/${pkgname}.edn" "${pkgdir}/opt/${pkgname}/${pkgname}.edn"

  install -Dm755 "${srcdir}/start_omnia.sh" "${pkgdir}/usr/bin/${pkgname}"
}
