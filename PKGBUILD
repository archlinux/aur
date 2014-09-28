# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=epymc
pkgname=$_pkgname-git
pkgver=1.0.0.r0.g65b28b7
pkgrel=1
pkgdesc="Media Center based on EFL - Development version"
arch=('any')
url="https://github.com/DaveMDS/epymc"
license=('GPL3')
depends=('python2-efl')
optdepends=('lirc: remote contol support'
            'mutagen: Music module'
            'python2-beautifulsoup4: Online Channels module'
            'sdlmame: MAME module')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("git://github.com/DaveMDS/epymc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | sed 's/^v//;s/-beta/beta/;s/-/.r/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's/env python$/&2/' $(find -name "*.py" 2> /dev/null) epymc/extapi/youtube-dl
}

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root="$pkgdir" --optimize=1
}
