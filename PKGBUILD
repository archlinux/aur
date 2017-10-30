# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-producer

_pkgname=producer
pkgname=${_pkgname}
pkgver=2.2.0
pkgrel=1
pkgdesc="Producer is a command-line quality-assurance tool to validate, and then release, your PHP library package."
arch=("any")
url="http://getproducer.org/"
license=("MIT")
depends=("php>=5.6.0" "composer" "phpdocumentor2")
source=("https://github.com/producerphp/producer.producer/archive/${pkgver}.tar.gz")
sha512sums=('12fce78a5f6c648216712391691fa370a6b0814b0199255baf51a48acd9a2a9f3f3ef8c8927df038ce7bbd29558c33a4845f3f98926acc01de5740089071300d')

build() {
  cd "${srcdir}/producer.producer-${pkgver}/"
  composer install
}

package() {
  install -D -m 644 "${srcdir}/producer.producer-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d -m 755 "${pkgdir}/opt/"
  mv "${srcdir}/producer.producer-${pkgver}" "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
