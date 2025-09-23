# Maintainer: envolution
# Contributor: Luís Ferreira < org dot aurorafoss at luis, backwards>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname="ruby-cabin"
#0.9.0 gem never made a tag release on github
#https://github.com/jordansissel/ruby-cabin/issues/51
pkgver=0.9.1
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
sha256sums=('dcc9385af8039ba8fb6e33f0a9036e9e9fedec71c842343ce8e6101776e0322d')

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
