# Maintainer: Klimenko Maxim <klimenkomaximsergievich@gmail.com>
# Contributor: Ryan Finnie <ryan@finnie.org>

_name=twuewand-git
pkgbase="${_name}"
pkgname=("${pkgbase}")
pkgver=0.0.4
pkgrel=1
pkgdesc="twuewand - A TrueRand algorithm for generating entropy"
arch=('any')
url="https://github.com/rfinnie/twuewand.git"
license=('MPL-2.0')
depends=('python-pycryptodome' 'python3')
makedepends=('git')
source=("${pkgname}::git+https://github.com/rfinnie/twuewand.git")
sha1sums=('SKIP')
conflicts=('twuewand-git')
provides=('twuewand-git')

makedepends=(git python-build python-installer python-wheel)

#if [[ "$_name" =~ ^\w+ ]]; then
#	name="${BASH_REMATCH[1]}"
#fi

build() {
	#cd "$srcdir/$_name"
	cd "twuewand"
	python -m build --wheel --no-isolation
	cd "../rndaddentropy"
	make rndaddentropy
}

package() {
	#cd "$srcdir/$_name"
	cd "twuewand"
	python -m installer --destdir="$pkgdir" dist/*.whl
	cd "../rndaddentropy"
	make DESTDIR="$pkgdir/" install
}
