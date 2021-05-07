# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=xournal-git
_gitname=xournal
pkgver=0.4.8.2016.15.gc29e2a4
pkgrel=1
pkgdesc="Notetaking and sketching application"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/xournal/"
license=('GPL')
depends=('libgnomecanvas' 'shared-mime-info' 'poppler-glib'
         'hicolor-icon-theme' 'desktop-file-utils' 'gtk2')
makedepends=('git' 'gettext')
optdepends=('ghostscript: import PS/PDF files as bitmap backgrounds')
provides=('xournal')
conflicts=('xournal' 'xournal-image-patched' 'xournalpp-svn')
source=('xournal::git+https://git.code.sf.net/p/xournal/code')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's/^Release[-_]//; s/[-_]/./g'
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install desktop-install
}

# vim:set ts=2 sw=2 et:
