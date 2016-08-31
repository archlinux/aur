#! /bin/bash
# Maintainer: Rafael Cavalcanti <rc.cavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon 

pkgname=nicotine-plus-git
pkgver=r1748.4a64caf
pkgrel=1
pkgdesc="A fork of nicotine, a Soulseek music-sharing client written in python. Gitversion."
arch=('i686' 'x86_64')
url="http://nicotine-plus.org"
license=('GPL')
depends=('pygtk' 'gtk2' 'mutagen')
makedepends=('git' 'python2')
optdepends=('miniupnpc: To enable UPnP support'
	    'python-sexy: To enable spell checking'
	    'python-geoip: To enable geographical blocker')
conflicts=('nicotine' 'nicotine-plus')
replaces=('nicotine' 'nicotine-plus')
source=(git+https://github.com/eLvErDe/nicotine-plus.git)
sha512sums=('SKIP')

_gitname=nicotine-plus

pkgver() {
	cd "${srcdir}/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  python2 setup.py install --root=$srcdir/pkg
}

package() {
  mv ${srcdir}/pkg/* ${pkgdir}  
}
