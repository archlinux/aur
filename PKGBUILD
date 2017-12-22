# Maintainer: Christian Meter <cmeter@gmail.com>

pkgname=omnia
pkgver=0.1.0
pkgrel=1
pkgdesc="Omnia is a REPL with almost all the power of a fully fledged editor, without being an editor"
arch=('x86_64')
url="https://github.com/AvramRobert/omnia"
license=('APL')
provides=('omnia')
conflicts=('omnia')
depends=('java-runtime')

source=("${url}/releases/download/${pkgver}-BETA/${pkgname}-${pkgver}.tar")
md5sums=('9e740de0040653cae8b5f650870b9612')

# build() {
#   tar xvf "${pkgname}-${pkgver}.tar"
# }

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
