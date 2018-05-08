# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-producer

_pkgname=producer
pkgname=${_pkgname}
pkgver=2.3.0
pkgrel=1
pkgdesc="Producer is a command-line quality-assurance tool to validate, and then release, your PHP library package."
arch=("any")
url="http://getproducer.org/"
license=("MIT")
depends=("php>=5.6.0" "composer" "phpdocumentor2")
source=("https://github.com/producerphp/producer.producer/archive/${pkgver}.tar.gz")
sha512sums=('bc3c9e0a8bf480171bfc8c2d7cc892b2738f98a1596c27348eb3fa07637045ebcb7ac70f32fd3c4ce28b6db3c5db04cb0e9933112725741f5d94810d08cc59d9')

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
