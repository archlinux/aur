# Maintainer: Ismaël Bouya <ismael.bouya@normalesup.org>

_pkgname=terminal_velocity
pkgname=terminal_velocity-git
pkgver=0.102.9062e85
pkgrel=1
pkgdesc="A fast note-taking app for the UNIX terminal (patched)"
arch=('any')
url="https://github.com/seanh/terminal_velocity"
license=('GPL')
depends=("python2-urwid" "python2-chardet")
makedepends=('git')
source=(
  'git://github.com/seanh/terminal_velocity.git'
  '001_fix_shell_escape.patch'
  '002_sort_found_notes.patch'
)
sha1sums=('SKIP'
          '92addaf76d635bf0ece018c8b35bb6a70740a1ae'
          '426613e5620251c37854e489b21e4790c6c7df3b')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_pkgname/$_pkgname"
  patch -p1 < ../../001_fix_shell_escape.patch
  patch -p1 < ../../002_sort_found_notes.patch
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
