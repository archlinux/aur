# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.2.5'
pkgrel='1'
epoch='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python>=3.7.0' 'python-chardet' 'python-humanfriendly' 'smartmontools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('71e2674c83fb6313788e135c7361c0d95a9746df544c2db08d735869d38822176908004e8c995bbec7c34e362dd19d7db79a14bb30d57dd0347a3f67d56f0c69')

_sourcedirectory="$_reponame-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"

	# setuptools-scm normally needs a git repo, set an explicit version instead
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
}
