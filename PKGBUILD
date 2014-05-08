# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname=svg2pdf-git
pkgver=20100911
pkgrel=2
pkgdesc="Conversion of SVGs to PDFs via cairo"
arch=('i686' 'x86_64')
url="http://cairographics.org/"
license=('custom')
depends=('librsvg>=2.0' 'cairo')
makedepends=('git')
provides=('svg2pdf')

_gitroot="git://people.freedesktop.org/~cworth/"
_gitname="svg2pdf"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
}
package() {
  cd "$srcdir/$_gitname-build"
	install -Dm755 svg2pdf ${pkgdir}/usr/bin/svg2pdf
} 
# vim:set ts=2 sw=2 et:
