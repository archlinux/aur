#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Brennan Frydl <me@bfrydl.com>

pkgname='mercurial-server'
pkgver=1.3
pkgrel=1
pkgdesc='Provides easily administered shared SSH access to Mercurial repositories.'
arch=('any')
url='http://www.lshift.net/mercurial-server.html'
license=('GPL')
depends=('mercurial')
makedepends=('python2-distribute')
install='mercurial-server.install'
source=("http://dev.lshift.net/paul/mercurial-server/mercurial-server_$pkgver.tar.gz")
md5sums=('7cb8e5eb12e7e7a6a9434d7eb67b97d0')

build() {
	cd "$srcdir"/mercurial-server-$pkgver
	sed -i 's/python setup.py/python2 setup.py/' Makefile
	find ./src -type f | xargs sed -i 's/env python/env python2/'

	make pythonbuild
}

package() {
	cd "$srcdir"/mercurial-server-$pkgver

	make PREFIX='/usr/share' DESTDIR="$pkgdir/" installetc pythoninstall
}

