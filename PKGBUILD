# Contributor: Angelo Theodorou <encelo@gmail.com>
pkgname=pacstats-hg
pkgver=21
pkgrel=1
pkgdesc="Statistical charts about pacman activity"
arch=('any')
url="http://pacstats.googlecode.com"
license=('GPL')
depends=('pygtk' 'python-matplotlib')
makedepends=('mercurial' 'gettext')
provides=('pacstats')
conflicts=('pacstats')

_hgroot=https://pacstats.googlecode.com/hg/
_hgrepo=pacstats

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  # Building and installing
  python setup.py install --root=$pkgdir --prefix=/usr
}
