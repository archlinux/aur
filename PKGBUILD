# Maintainer: Andrea Richiardi <a.richiardi.work@gmail.com>
# Contributor: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
#
# namcap warns that ruby-sexp_processor is an unnecessary dependency. This is
# untrue.
#
# this package is also depended up by Emacs' feature-mode aka cucumber.el

pkgname=ruby-ruby_parser
_pkgname=ruby_parser
pkgver=3.14.2
pkgrel=1
pkgdesc='Ruby parser written in pure ruby.'
arch=(any)
url='https://github.com/seattlerb/ruby_parser'
license=(MIT)
depends=('ruby-sexp_processor>=4.9.0')
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(LICENSE "https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('46870842926785c757eb95c36c7c77235871c7fd2310e93ef72b681ac9ccfd53'
            'cc28083336412b4604f7c7c766cbd8b6075d27d7a9962a9979e70e2ea56f0c27')

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
