# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: carstene1ns <arch carsten-teibes de>
#
# namcap warns that ruby-cri is an unnecessary dependency. This is untrue.

pkgname=nanoc
pkgver=3.8.0
pkgrel=1
pkgdesc='A simple, flexible static site generator written in Ruby.'
arch=(any)
url='http://nanoc.ws'
license=(MIT)
depends=(ruby-cri)
makedepends=(rubygems)
optdepends=(
    "adsf: Provides 'nanoc view' command."
    "ruby-builder: Allows generating rss feeds and sitemaps."
    "ruby-guard-nanoc: Regenerates site on filesystem changes."
    "ruby-kramdown: Filter for Markdown input files."
    "ruby-listen: Provides 'nanoc watch' command."
    "ruby-nokogiri: Provides 'nanoc check' command."
    "ruby-w3c_validators: Provides 'nanoc check' command."
)
provides=(ruby-nanoc3 ruby-nanoc)
conflicts=(ruby-nanoc3 ruby-nanoc)
options=(!emptydirs)
source=("http://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('382397d761ea1a97537eaee995e37ba416f7f7f093090cc812071a9eb28cea1e')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}.gem"

  # install license
  install -Dm 644 \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${pkgname}-${pkgver}"/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
