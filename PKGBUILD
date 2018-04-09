# Maintainer: Jeremy Audet <jerebear@protonmail.com>

pkgname=ruby-lumberjack
_pkgname="${pkgname#ruby-}"
pkgver=1.0.13
pkgrel=1
pkgdesc='A simple, powerful, and fast logging implementation in Ruby.'
arch=(any)
url='https://github.com/bdurand/lumberjack'
license=(MIT)
depends=()
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('b6b80d5ea2608fa2fbd1b3783318b0e0f7e4a950ad70f1a13fa70bf2d83b351a')

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
