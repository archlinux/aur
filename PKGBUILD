# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>

pkgname=ruby-lumberjack
_pkgname="${pkgname#ruby-}"
pkgver=1.0.9
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
sha256sums=('940484987b3b063aa18d83169816cc9a81681451b869c690bca878be44cd4e98')

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
