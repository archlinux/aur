# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-producer

_pkgname=producer
pkgname=${_pkgname}
pkgver=2.1.0
pkgrel=1
pkgdesc="Producer is a command-line quality-assurance tool to validate, and then release, your PHP library package."
arch=("any")
url="http://getproducer.org/"
license=("MIT")
depends=("php" "composer" "phpdocumentor2")
source=("https://github.com/producerphp/producer.producer/archive/${pkgver}.tar.gz")
sha512sums=('bd7da5283cb32ff5971b872d829a992be2fa0f305a0f3ab31a48b4d76a38bd57ff8821281a6d2993759eb3672055380d15f8b2bf1e1ba8eb1bdbdef5e82797eb')

build() {
  cd "${srcdir}/producer.producer-${pkgver}/"
  composer install
}

package() {
  install -D -m 644 "${srcdir}/producer.producer-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d -m 755 "${pkgdir}/opt/"
  mv "${srcdir}/producer.producer-${pkgver}" "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
