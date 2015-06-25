# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
#
# namcap warns that ruby-sexp_processor is an unnecessary dependency. This is
# untrue.

pkgname=ruby-ruby_parser
_pkgname=ruby_parser
pkgver=3.7.0
pkgrel=1
pkgdesc='Ruby parser written in pure ruby.'
arch=(any)
url='https://github.com/seattlerb/ruby_parser'
license=(MIT)
depends=(ruby-sexp_processor)
makedepends=(rubygems)
options=(!emptydirs)
source=(LICENSE "http://gems.rubyforge.org/gems/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('46870842926785c757eb95c36c7c77235871c7fd2310e93ef72b681ac9ccfd53'
            '95d2036b753f399706e3478c1033a81520b27ccf8702e8de076cdfcaff5f1de4')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_pkgname}-${pkgver}.gem"

  # install license
  install -Dm 644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
