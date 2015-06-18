# -*- shell-script -*-
# Arch Linux package build script
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
#
# $Id$

_hgname=hgsubversion
pkgname=$_hgname-hg
pkgver=1000.09b5e6a76724
pkgrel=1
pkgdesc="extension for Mercurial that allows using Mercurial as a Subversion client"
arch=(any)
url="http://mercurial.selenic.com/wiki/HgSubversion"
license=('GPL2')
install=hgsubversion-hg.install
depends=('mercurial' 'subversion')
makedepends=('mercurial')
source=('hg+http://bitbucket.org/durin42/hgsubversion')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_hgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_hgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

pkgver() {
  cd "$srcdir/$_hgname"
  hg identify -ni 2>/dev/null | awk 'BEGIN{OFS=".";} {print $2,$1}'
}
