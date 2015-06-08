# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=betty
pkgver=0.1.7
pkgrel=1
pkgdesc="Friendly English-like interface for your command line"
arch=('any')
url="https://github.com/pickhardt/betty"
license=('Apache')
depends=('ruby')
source=("https://github.com/pickhardt/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ed71e88a659725e0c475888df044c9de3ab1474ff483f0a3bb432949035e62d3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Set absolute paths for static files
  sed -i "s^File.dirname(__FILE__) + '/lib^'/usr/lib/${pkgname}^g" main.rb
  sed -i "s^ENV\['HOME'\] + '/.^'/etc/${pkgname}/^g" lib/config.rb
  sed -i "s^ENV\['HOME'\] + '/.^'/var/log/${pkgname}/^g" main.rb
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/etc/${pkgname}"

  install -Dm666 /dev/null "${pkgdir}/var/log/${pkgname}/betty_history"
  install -D main.rb "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 lib/* -t "${pkgdir}/usr/lib/${pkgname}"
}

# vim:set ts=2 sw=2 et:
