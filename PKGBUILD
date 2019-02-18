# $Id$
# Maintainer: Jens Staal <staal1978@gmail.com>
# adapted from "newsboat" package:
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Sven Pfleiderer <pfleidi@roothausen.de>

pkgname=newsboat-git
pkgver=r2.14.1.r8.gf03cd8d8
pkgrel=1
pkgdesc="An RSS/Atom feed reader for text terminals"
arch=('x86_64')
url="https://newsboat.org/"
license=('custom: MIT')
depends=('curl' 'json-c' 'libxml2' 'sqlite' 'stfl' 'rust')
makedepends=('swig' 'gettext' 'asciidoc')
provides=('newsboat')
conflicts=('newsboat')
replaces=('newsbeuter')
options=('!emptydirs')
source=($pkgname::git+https://github.com/newsboat/newsboat.git)
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}"/$pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${srcdir}"/$pkgname

  make prefix=/usr
  make doc
}

package() {
  cd "${srcdir}"/$pkgname

  make prefix=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

