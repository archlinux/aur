# Maintainer: Jeremy Audet <jerebear@protonmail.com>

pkgname=ruby-lumberjack
_pkgname="${pkgname#ruby-}"
pkgver=1.0.12
pkgrel=3
pkgdesc='A simple, powerful, and fast logging implementation in Ruby.'
arch=(any)
url='https://github.com/bdurand/lumberjack'
license=(MIT)
depends=()
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('77c5dbc7d07522d18014cb5637b350c779c17be06d57ba71e8b28158d334e27b')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_pkgname}-${pkgver}.gem"

  # install license
  install -Dm 644 \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${_pkgname}-${pkgver}"/MIT_LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/MIT_LICENSE"
}

# vim:set ts=2 sw=2 et:
