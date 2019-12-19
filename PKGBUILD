# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=uberwriter-git
pkgver=2.2.0.beta1.4.r149.g0bcb2f3
pkgrel=1
pkgdesc='A distraction free Markdown editor for GNU/Linux made with GTK+'
arch=(any)
url="http://uberwriter.github.io/uberwriter/"
license=(GPL3)
depends=(gtk3 gspell gobject-introspection webkit2gtk
         python-cairo
         python-levenshtein
         python-pyenchant
         python-pypandoc
         python-regex
)
makedepends=(git meson)
optdepends=("texlive-core: Export as PDF files"
            "otf-fira-mono: Recommended font (OTF)"
            "ttf-fira-mono: Recommended font (TTF)")
provides=(uberwriter)
conflicts=(uberwriter)
source=("git+https://github.com/UberWriter/uberwriter.git")
sha256sums=(SKIP)

pkgver() {
  cd uberwriter
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd uberwriter
  meson build --prefix=/usr
}

package() {
  cd uberwriter
  DESTDIR="${pkgdir}" ninja -C build install
}
