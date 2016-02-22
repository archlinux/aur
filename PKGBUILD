# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=ruby-ruby2ruby
_pkgname="${pkgname#ruby-}"
pkgver=2.3.0
pkgrel=1
pkgdesc='Easily generate pure ruby code from RubyParser compatible Sexps.'
arch=(any)
url='https://github.com/seattlerb/ruby2ruby'
license=(MIT)
depends=(ruby-ruby_parser)
makedepends=(rubygems)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('19d9648bebce9eb08f279192ba18a03b9776a29fa527f2654191b4a12daad487')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_pkgname}-${pkgver}.gem"

  # Install license. License cannot be extracted from readme at any earlier
  # point, because the readme file has not yet been extracted from the gem.
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  sed -n '/LICENSE/,$p' \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${_pkgname}-${pkgver}"/README.txt > \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
