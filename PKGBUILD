# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
# Maintainer: Laszlo Papp <djszapi at archlinux us>

pkgname=django-registration-hg
pkgver=20101010
pkgrel=1
pkgdesc="A user-registration application for Django."
arch=(any)
url="http://bitbucket.org/ubernostrum/django-registration/wiki/Home"
license=('GPL')
depends=('python' 'django')
conflicts=('django-registration')
provides=('django-registration')
source=()
md5sums=()

_hgbranch=http://bitbucket.org/ubernostrum/django-registration/
_hgrepo=django-registration

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
