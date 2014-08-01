# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=epymc
pkgname=$_pkgname-git
pkgver=1.0.0beta1.r1.ge213b2b
pkgrel=1
pkgdesc="Media Center based on EFL - Development version"
arch=('any')
url="https://github.com/DaveMDS/epymc"
license=('GPL3')
depends=('python2-efl')
optdepends=('mutagen: music module'
            'lirc: remote contol support'
            'sdlmame: MAME module')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/DaveMDS/epymc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | sed 's/^v//;s/-beta/beta/;s/-/.r/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  find -name "*.py" -exec sed -i 's/env python$/&2/' {} \;
}

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root="$pkgdir" --optimize=1
}
