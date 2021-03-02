# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=apostrophe
pkgver=2.3
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
sha256sums=('944ee2d83c05afac148e1b819c213274f544c23e5338088271e967a6e83a09d2')

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
