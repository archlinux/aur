# Maintainer: Ismaël Bouya <ismael.bouya@normalesup.org>

_pkgname=terminal_velocity
pkgname=terminal_velocity-git
pkgver=0.1a7.r21.gbb2000b
pkgrel=1
pkgdesc="A fast note-taking app for the UNIX terminal (patched)"
arch=('any')
url="https://github.com/vhp/terminal_velocity"
license=('GPL')
depends=("python2-urwid" "python2-chardet")
makedepends=('git')
source=(
  'git://github.com/vhp/terminal_velocity.git'
  '002_sort_found_notes.patch'
)
sha1sums=('SKIP'
          '426613e5620251c37854e489b21e4790c6c7df3b')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/$_pkgname"
  patch -p1 < ../../002_sort_found_notes.patch
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
