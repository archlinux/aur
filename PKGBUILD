# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=apostrophe-git
pkgver=2.5.r30.g3150e40
pkgrel=1
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://apps.gnome.org/app/org.gnome.gitlab.somas.Apostrophe"
license=('GPL3')
depends=('gspell' 'libhandy' 'otf-fira-mono' 'python-cairo' 'python-gobject'
         'python-levenshtein' 'python-pyenchant' 'python-pypandoc''python-regex'
         'webkit2gtk')
makedepends=('git' 'meson' 'gobject-introspection' 'sassc')
checkdepends=('appstream-glib')
optdepends=('texlive-latexextra: for the pdftex module'
            'mathjax: for formula preview')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/apostrophe.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson -Dprofile=development "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
