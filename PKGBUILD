# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=django-storages-hg
_pkgname=django-storages
pkgver=1.1.8.r296
pkgrel=1
pkgdesc="Collection of custom storage backends for Django"
arch=('any')
url="http://code.larlet.fr/django-storages/"
license=('BSD3')
depends=('python2-django' 'python2-boto')
makedepends=('mercurial' 'python' 'python2')
source=('hg+https://bitbucket.org/david/django-storages')
sha512sums=('SKIP')

pkgver() {
	 cd ${srcdir}/${_pkgname}
	 _revno="$(hg identify -n)"
	 _mainver="$(hg log -r "$_revno" --template '{latesttag}' | sed -E 's/v//;s/-/./g')"
	 echo "${_mainver}.r${_revno}"
}

prepare() {
	 cp -PR --preserve=links,mode,timestamps ${srcdir}/${_pkgname}{,-2}
}

build() {
	 cd ${srcdir}/${_pkgname}
	 python setup.py build
	 cd ${srcdir}/${_pkgname}-2
	 python2 setup.py build
}

package() {
	 cd ${srcdir}/${_pkgname}
	 python setup.py install --root="$pkgdir" --optimize=1
	 cd ${srcdir}/${_pkgname}-2
	 python2 setup.py install --root="$pkgdir" --optimize=1
}
