# Maintainer: Simon Schubert <2-aur@0x2c.org>
pkgname=asciidoc-language-documentation-git
pkgver=r475.bd16776
pkgrel=1
pkgdesc="AsciiDoc Language Documentation, offline HTML build"
arch=('any')
url=""
license=('GPL')
makedepends=('antora-cli' 'antora-site-generator')
source=('git+https://github.com/asciidoctor/asciidoc-docs.git#branch=main'
	'playbook.yml')
sha256sums=('SKIP'
            '2eccc2106507d4b4e082532324a0317a39c64ad3079210c3852131b643e6dbac')
pkgver() {
  cd asciidoc-docs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"

  rm -rf build

  CI=1 antora generate playbook.yml
}

package() {
  install -d "$pkgdir/usr/share/doc/asciidoc-language"

  cd "$srcdir/build/"
  cp -R . "$pkgdir/usr/share/doc/asciidoc-language/"
}

# vim:set ts=2 sw=2 et:
