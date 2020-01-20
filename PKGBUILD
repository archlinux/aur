# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='deep_merge'
pkgname="ruby-${_gemname}"
pkgver=1.2.1
pkgrel=1
pkgdesc='Recursively merge Ruby hashes'
arch=('any')
url='https://github.com/danielsdeleo/deep_merge'
license=('MIT')
makedepends=('ruby-rdoc')
checkdepends=('ruby-rake' 'ruby-minitest' 'ruby-test-unit')
depends=('ruby')
options=(!emptydirs)
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d5a61761e0d7d83d0956f98d6d2e841427b9b7a6d8f80598bd97c5dea7bdd582a6d406ed0d8701180c0a8a950a5bbd50a50349ec4b85e5a3e999dcb3741de25f')

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake test
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
