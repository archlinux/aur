# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Adria Arrufat <swiftscythe @t gmail d@t com>
# Contributor: Gordin <9ordin @t gmail d@t com>

pkgname=screenkey-git
pkgver=0.2.c2720b9
_pkgver=0.2
pkgrel=1
pkgdesc="Screencast tool to show your keys inspired by Screenflick, based on key-mon. Patched version available on GitHub."
arch=('any')
url="https://github.com/scs3jb/screenkey"
license=('GPL3')
depends=('python2' 'pygtk' 'python2-xlib' 'xorg-xmodmap' 'python2-keybinder2')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/scs3jb/screenkey.git")
sha1sums=('SKIP')
conflicts=('screenkey')
replaces=('screenkey')

pkgver() {
  _hash=`git log --pretty=format:'%h' -n 1`
  echo $_pkgver"."$_hash
}

build() {
  cd "$srcdir/$pkgname"

  # Fix hardcoded install path...
  sed -i "s|/usr/share/|share/|" setup.py
  sed -i "1s|env python|env python2|" Screenkey/modmap.py

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --skip-build --prefix=${pkgdir}/usr
}

# vim:set ts=2 sw=2 et:
