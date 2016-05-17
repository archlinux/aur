# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=betty
pkgver=0.1.8
pkgrel=1
pkgdesc="Friendly English-like interface for your command line"
arch=('any')
url="https://github.com/pickhardt/betty"
license=('Apache')
depends=('ruby')
# temporary hack since the pkgver is not taged
source=("https://github.com/pickhardt/${pkgname}/archive/e1fc356c1c9c135a6e647e0c9552685d142e73a4.zip")
#source=("https://github.com/pickhardt/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a61b8025ad37822edbf5ddbf71bdde787c6c40989c26dc1897aae9d22118ee68')

prepare() {
  cd "${srcdir}/${pkgname}-"*
  #cd "${srcdir}/${pkgname}-${pkgver}"

  # Set absolute paths for static files
  sed -i "s^File.dirname(__FILE__) + '/lib^'/usr/lib/${pkgname}^g" main.rb
  sed -i "s^ENV\['HOME'\] + '/.^'/etc/${pkgname}/^g" lib/config.rb
  sed -i "s^ENV\['HOME'\] + '/.^'/var/log/${pkgname}/^g" main.rb
}

package() {
  cd "${srcdir}/${pkgname}-"*
  #cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/etc/${pkgname}"

  install -Dm666 /dev/null "${pkgdir}/var/log/${pkgname}/betty_history"
  install -D main.rb "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 lib/* -t "${pkgdir}/usr/lib/${pkgname}"
}

# vim:set ts=2 sw=2 et:
