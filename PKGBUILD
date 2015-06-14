# Maintainer:  Tjaart van der walt <aur@tjaart.co.za>
#
# This is a modified version of the AUR package lfm, downloading the latest
# sources from the project's official mercurial repository
#
# The latest released version of lfm (2.3 at the time of writing) had a blocking
# bug for me. This bug appears to be fixed in version control, but no release
# with this fix has been made yet.

pkgname=lfm-hg
pkgver=20150522
pkgrel=1
pkgdesc="A powerful file manager for the UNIX console. This package downloads the latest source from version control."
arch=('any')
url="https://bitbucket.org/inigoserna/lfm"
license=('GPL3')
conflicts='lfm'
depends=('ncurses>=5.0' 'python2>=2.6')
makedepends=('mercurial')
source=(hg+https://bitbucket.org/inigoserna/lfm)

md5sums=('SKIP')

build() {
  cd "$srcdir/lfm"
  sed -i '1s,env python,&2,' lfm/*
  python2 setup.py build
}

package() {
  cd "$srcdir/lfm"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
