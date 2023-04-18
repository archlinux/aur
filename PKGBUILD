# Contributor: Ícar N. S. <icar dot nin at pm dot me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=setzer-git
pkgver=55.r10.g35e4639
pkgrel=1
pkgdesc='LaTeX editor written in Python with Gtk'
arch=('any')
url='https://www.cvfosammmm.org/setzer/'
license=('GPL3')
depends=('gspell' 'gtk3' 'gtksourceview4' 'poppler-glib' 'python-cairo'
	 'python-gobject' 'python-pdfminer' 'python-pyxdg' 'texlive-core'
	 'webkit2gtk' 'xdg-utils' 'libhandy' 'python-bibtexparser')
makedepends=('appstream' 'git' 'meson')
provides=('setzer')
conflicts=('setzer')
source=('git+https://github.com/cvfosammmm/Setzer.git')
sha256sums=('SKIP')

pkgver() {
  cd Setzer
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson --prefix=/usr --buildtype=plain Setzer build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

