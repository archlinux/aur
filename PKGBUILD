# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>

pkgname=ruby-lumberjack
_pkgname="${pkgname#ruby-}"
pkgver=1.0.10
pkgrel=1
pkgdesc='A simple, powerful, and fast logging implementation in Ruby.'
arch=(any)
url='https://github.com/bdurand/lumberjack'
license=(MIT)
depends=()
makedepends=(rubygems)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('64eb76f7898436256c359dc8ee54924d8fe24f35159ff553e0a9243c90449e46')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_pkgname}-${pkgver}.gem"

  # install license
  install -Dm 644 \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${_pkgname}-${pkgver}"/MIT_LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/MIT_LICENSE"
}

# vim:set ts=2 sw=2 et:
