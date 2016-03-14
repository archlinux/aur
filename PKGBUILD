# Maintainer: Ismaël Bouya <ismael.bouya@normalesup.org>

_pkgname=terminal_velocity
pkgname=terminal_velocity-git
pkgver=0.96.5667177
pkgrel=2
pkgdesc="A fast note-taking app for the UNIX terminal (patched)"
arch=('any')
url="https://github.com/seanh/terminal_velocity"
license=('GPL')
depends=("python2-urwid" "python2-chardet")
makedepends=('git')
source=(
  'git://github.com/seanh/terminal_velocity.git'
  '001_fix_shell_escape.patch'
)
sha1sums=('SKIP'
          '7b04f0f28a4801931f7a0e499f5131d5a5c3653c')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_pkgname/$_pkgname"
  patch -p1 < ../../001_fix_shell_escape.patch
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
