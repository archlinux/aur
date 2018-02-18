# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
#
# namcap warns that ruby-sexp_processor is an unnecessary dependency. This is
# untrue.

pkgname=ruby-ruby_parser
_pkgname=ruby_parser
pkgver=3.11.0
pkgrel=1
pkgdesc='Ruby parser written in pure ruby.'
arch=(any)
url='https://github.com/seattlerb/ruby_parser'
license=(MIT)
depends=(ruby-sexp_processor)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(LICENSE "http://gems.rubyforge.org/gems/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('46870842926785c757eb95c36c7c77235871c7fd2310e93ef72b681ac9ccfd53'
            '419239c3b8d6c015f86eb110dee7c85a2527cce1be3ba86133d66fd87dabda57')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_pkgname}-${pkgver}.gem"

  # install license
  install -Dm 644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
