# Maintainer: envolution
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>
# shellcheck shell=bash disable=SC2034,SC2154

_gemname=asciidoctor-diagram
pkgname=ruby-$_gemname
pkgver=2.3.1
pkgrel=2
pkgdesc='Asciidoctor diagramming extension'
arch=(any)
url='https://github.com/asciidoctor/asciidoctor-diagram'
license=('MIT')
depends=(ruby asciidoctor ruby-rexml ruby-asciidoctor-diagram-batik ruby-asciidoctor-diagram-ditaamini ruby-asciidoctor-diagram-plantuml)
makedepends=(ruby-rdoc)
optdepends=('ttf-font: font for diagram'
  'java-runtime: for ditaa, plantuml diagrams'
  'blockdiag: for blockdiag diagrams'
  'gnuplot: for gnuplot diagrams'
  'graphviz: for graphviz diagrams'
  'meme: meme extension'
  'mermaid-cli: for mermaid diagrams')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('3f755c682491c325cc625f15dcf96a7e18d86db9')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
# vim:set ts=2 sw=2 et:
