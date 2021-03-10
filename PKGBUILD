# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=apostrophe
pkgver=2.4
pkgrel=1
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://somas.pages.gitlab.gnome.org/apostrophe"
license=('GPL3')
depends=('webkit2gtk' 'gspell' 'python-pypandoc' 'python-regex' 'python-levenshtein'
         'python-pyenchant' 'python-gobject' 'python-cairo' 'otf-fira-mono' 'libhandy')
makedepends=('meson' 'gobject-introspection')
optdepends=('texlive-latexextra: for the pdftex module'
            'mathjax: for formula preview')
source=("https://gitlab.gnome.org/somas/apostrophe/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c5c7d1a98cbdb850f61294357a30215d086ec20bd494319e29e64ea3197301c7')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
