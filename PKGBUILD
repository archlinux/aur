# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=solargraph
pkgname=ruby-solargraph
pkgver=0.57.0
pkgrel=3
pkgdesc="A Ruby language server"
arch=("any")
depends=(
  ruby
  ruby-backport
  ruby-benchmark
  ruby-bundler
  ruby-diff-lcs
  ruby-e2mmap
  ruby-jaro_winkler
  ruby-kramdown
  ruby-kramdown-parser-gfm
  ruby-observer
  ruby-parser
  ruby-prism
  ruby-rbs
  ruby-reverse_markdown
  ruby-rubocop
  ruby-thor
  ruby-tilt
  ruby-yard
  ruby-yard-activesupport-concern
  ruby-yard-solargraph
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(
  https://rubygems.org/downloads/$_gemname-$pkgver.gem
  lower-prism-version-requirement.patch
  lower-rubocop-version-requirement.patch
)
sha256sums=('87a3a0ec974aba63430ea7a23dcf1fda32d705841a2176ffd32394bdc4a1a24c'
            'dd01bca2f3e4427100da46064570f87776d5d6f2145c1d6e6503ebc2141f2829'
            'd9ed9b5f646cf329eb6f688817e99f0a3157e18916ec38f0016491d4faaf9ac9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  cd "$pkgdir"
  cat "$srcdir/lower-prism-version-requirement.patch" | patch -p1
  cat "$srcdir/lower-rubocop-version-requirement.patch" | patch -p1
}
