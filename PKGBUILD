# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=apostrophe
pkgver=2.2.0.3
pkgrel=1
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://gitlab.gnome.org/somas/apostrophe"
license=('GPL3')
depends=('webkit2gtk' 'gspell' 'python-pypandoc' 'python-regex' 'python-levenshtein'
         'python-pyenchant' 'python-gobject' 'python-cairo' 'gobject-introspection')
makedepends=('git' 'meson')
checkdepends=('appstream')
optdepends=('texlive-latexextra: for the pdftex module'
            'mathjax: for formula preview'
            'otf-fira-mono: Recommended font (OTF)'
            'ttf-fira-mono: Recommended font (TTF)')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('79b7aa4913eceaf3a81baa23fe1071ae462b17f6b0f77d8e69f3d554474b4cab')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
