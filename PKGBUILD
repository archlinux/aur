# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=ruby-ruby2ruby
_pkgname="${pkgname#ruby-}"
pkgver=2.4.1
pkgrel=1
pkgdesc='Easily generate pure ruby code from RubyParser compatible Sexps.'
arch=(any)
url='https://github.com/seattlerb/ruby2ruby'
license=(MIT)
depends=(ruby-ruby_parser)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('3459ea9cd644436351dc8db9c02eb242a348cd4d8d22103703f71e4032578df3')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_pkgname}-${pkgver}.gem"

  # Install license. License cannot be extracted from readme at any earlier
  # point, because the readme file has not yet been extracted from the gem.
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  sed -n '/LICENSE/,$p' \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${_pkgname}-${pkgver}"/README.rdoc > \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
