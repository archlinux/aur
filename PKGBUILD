# Maintainer: thorsten w. <p@thorsten-wissmann.de>
pkgname=herbstluftwm-git
pkgver=v0.6.2.48.gceeae62
pkgrel=1
pkgdesc="Manual tiling window manager for X"
arch=('i686' 'x86_64')
url="http://wwwcip.cs.fau.de/~re06huxa/herbstluftwm"
license=('BSD')
depends=( 'glib2>=2.24' libx11 libxinerama )
optdepends=(
        'bash: needed by most scripts'
        'xterm: used by the default autostart'
        'dmenu: needed by some scripts'
        'dzen2-git: needed by panel.sh'
        'dzen2-xft-xpm-xinerama-svn: view icons as tags'
    )
makedepends=( git asciidoc )
provides=( herbstluftwm )
conflicts=( herbstluftwm )
backup=( )
source=("git://git.informatik.uni-erlangen.de/re06huxa/herbstluftwm")
md5sums=( SKIP )
_gitname="herbstluftwm"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"
  make PREFIX=/usr DESTDIR="$pkgdir" VERSION_SUFFIX="-git"
}

package() {
  cd "${srcdir}/${_gitname}"
  pwd
  make PREFIX=/usr DESTDIR="$pkgdir" VERSION_SUFFIX="-git" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
