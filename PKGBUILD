# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=solargraph
pkgname=ruby-solargraph
pkgver=0.56.2
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
  ruby-rbs
  ruby-reverse_markdown
  ruby-rubocop
  ruby-thor
  ruby-tilt
  ruby-yard
  ruby-yard-solargraph
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(
  https://rubygems.org/downloads/$_gemname-$pkgver.gem
  remove-prism-gemspec.patch
  update-rbs-dependency.patch
)
sha256sums=('b3cc0b3973071d7206238a2bcea7c254deed3ed37807f4440cadf0452f7752b8'
            '0b80b3a682cda22e78970a0c9ad75f12eef89d60a2a0a770807a73685093dfe2'
            '2d6b412e48a526a0e87f2bacb1d645363a1f6e08355c7cfeb5f6378add6eec4c')

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
  cat "$srcdir/remove-prism-gemspec.patch" | patch -p1
  cat "$srcdir/update-rbs-dependency.patch" | patch -p1
}
