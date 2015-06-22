# Maintainer: Lubosz Sarnecki <lubosz at gmail com>

pkgname=django-threaded-multihost-hg
pkgver=20101010
pkgrel=1
pkgdesc="Provides multi-host utilities to Django projects by using threadlocals, middleware and simple utilities. Using the middleware provided, you can easily provide multi-site awareness to any project."
arch=(any)
url="http://bitbucket.org/bkroeze/django-threaded-multihost"
license=('GPL')
depends=('python' 'django')
conflicts=('django-threaded-multihost')
provides=('django-threaded-multihost')
source=()
md5sums=()

_hgbranch=http://bitbucket.org/bkroeze/django-threaded-multihost
_hgrepo=django-threaded-multihost

build() {
	cd ${srcdir}

	if [ -d ${_hgrepo} ]; then
		(cd ${_hgrepo} && hg pull -u) || return 1
	else
		hg clone ${_hgbranch} || return 1
	fi

	msg "Mercurial clone done or server timeout"
	
	cd ${_hgrepo}
  
	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
