# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
#
# namcap warns that ruby-sexp_processor is an unnecessary dependency. This is
# untrue.

pkgname=ruby-ruby_parser
_pkgname=ruby_parser
pkgver=3.10.1
pkgrel=3
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
            '454806d4e1b2c606f36f7f4cc9cfd981c8bf6c7485b4e1963850ccdee6e20b38')

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
