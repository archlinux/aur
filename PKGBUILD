# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=nanoc
pkgver=4.1.6
pkgrel=1
pkgdesc='A simple, flexible static site generator written in Ruby.'
arch=(any)
url='http://nanoc.ws'
license=(MIT)
depends=(ruby-cri)
makedepends=(rubygems)
optdepends=(
  "adsf: Provides 'nanoc view' command."
  "ruby-builder: Provides 'Blogging' helper."
  "ruby-kramdown: Provides filter for Markdown input files."
  "ruby-nokogiri: Provides 'nanoc check' command."
  "ruby-pry: Provides 'nanoc shell' command."
  "ruby-w3c_validators: Provides 'nanoc check' command."
)
provides=(ruby-nanoc3 ruby-nanoc)
conflicts=(ruby-nanoc3 ruby-nanoc)
options=(!emptydirs)
source=("https://github.com/nanoc/nanoc/archive/${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('ed3a8ca6b1c1c946d0bace5819212d8463e0e4c82370bad663af2fbc97672c92')

build() {
  # create gem
  cd "${srcdir}/${pkgname}-${pkgver}"
  gem build nanoc.gemspec
  cp "${pkgname}-${pkgver}.gem" "${srcdir}/"
  cd -
}

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
