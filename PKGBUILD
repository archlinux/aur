# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontship
pkgver=0.8.2
pkgrel=4
pkgdesc='A font development toolkit and collaborative work flow'
arch=(any)
url="https://github.com/theleagueof/$pkgname"
license=(AGPL4)
depends=(diffutils
         entr
         font-v
         gftools
         git
         jq
         libarchive
         libgit2
         make
         psautohint
         python
         python-babelfont
         python-brotli # fonttools optdepends
         python-cffsubr # ufo2ft optdepends
         python-fontmake
         python-fonttools
         python-fs # fonttools optdepends
         python-lxml # fonttools optdepends
         python-pcpp
         python-skia-pathops # ufo2ft optdepends
         'python-ufo2ft>=2.19.1'
         python-ufonormalizer
         python-unicodedata2 # fonttools optdepends
         python-vttlib
         python-zopfli # fonttools optdepends
         'sfd2ufo>=1.0.7'
         sfdnormalize
         sfnt2woff-zopfli
         ttfautohint
         woff2
         zsh)
makedepends=(cargo
             rust)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('710687f2189a67f786c5e8dea389c8edb4edb4026aeca6ce306638d1bbc5a6ce')

prepare() {
	cd "$_archive"
	cargo fetch --locked
}

build() {
	cd "$_archive"
	./configure --prefix="/usr"
	make
}

check() {
	cd "$_archive"
	make check
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}
