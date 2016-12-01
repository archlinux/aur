# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Adria Arrufat <swiftscythe @t gmail d@t com>
# Contributor: Gordin <9ordin @t gmail d@t com>

pkgname=screenkey-git
pkgver=0.9.1b9d6c2
pkgrel=1
pkgdesc="Screencast tool to show your keys inspired by Screenflick, based on key-mon. Active fork with new features."
arch=('any')
url="https://github.com/wavexx/screenkey"
license=('GPL3')
depends=('python2' 'pygtk' 'libx11')
makedepends=('git' 'python2-distutils-extra' 'python2-setuptools')
optdepends=('slop' 'ttf-font-awesome')
source=("$pkgname"::"git+https://github.com/wavexx/screenkey.git")
sha1sums=('SKIP')
conflicts=('screenkey')
replaces=('screenkey')

pkgver() {
  cd "$srcdir/$pkgname"
  _rel=`git describe | sed 's/screenkey-\([0-9]\+[.0-9]\+\).*/\1/g'`
  _hash=`git log --pretty=format:'%h' -n 1`
  echo $_rel"."$_hash
}

build() {
  cd "$srcdir/$pkgname"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --skip-build --optimize=1 --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
