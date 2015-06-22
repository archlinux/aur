# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>

name=django-profiles
pkgname=$name-hg
pkgver=0.2.25.c21962558420
pkgrel=1
pkgdesc="A simple, generic user-profile application for Django"
arch=('any')
url="http://bitbucket.org/ubernostrum/django-profiles/wiki/Home"
license=('BSD')
depends=('python-django')
makedepends=('python-distribute')
provides=($name)
conflicts=($name)
source=("hg+https://bitbucket.org/ubernostrum/django-profiles")
md5sums=("SKIP")

pkgver() {
	cd $name
	vers=$(grep "version=" setup.py | sed "s/      version='//g" | sed "s/',//g")
  echo $vers.$(hg identify -n).$(hg identify -i)
}

build() { 
	cd $name
  python setup.py build
}

package() {
	cd $name
  python setup.py install --root="$pkgdir" -O1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
