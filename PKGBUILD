# Maintainer: envolution
# Contributor: Luís Ferreira < org dot aurorafoss at luis, backwards>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname="ruby-cabin"
#0.9.0 gem never made a tag release on github
#https://github.com/jordansissel/ruby-cabin/issues/51
pkgver=0.9.0
pkgrel=1
pkgdesc='Experiments in structured and contextual logging'
arch=(any)
url='https://github.com/jordansissel/ruby-cabin'
license=('Apache-2.0')
depends=('ruby')
makedepends=('rubygems')
options=(!emptydirs)
source=(https://rubygems.org/downloads/${pkgname#*-}-$pkgver.gem)
noextract=("${pkgname#*-}-$pkgver.gem")
sha256sums=('91c5394289e993e7037a6c869e3f212f31a5984d2b1811ac934f591c87446b2c')

package() {
  local _gemdir
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname#*-}-$pkgver.gem"
  find "${pkgdir}" -type f -name '*.gem' -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/${pkgname#*-}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir/$_gemdir"
  rm -rf cache gems/${pkgname#*-}-${pkgver}/{ext,lib/*/*.so} \
    extensions/*/*/${pkgname#*-}-${pkgver}/{mkmf.log,gem_make.out}
}
