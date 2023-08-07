# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.2.5'
_commit='d6ebff756b4fa7022013b29a4d3cf2ec84efdd84'
pkgrel='2'
epoch='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python>=3.7.0' 'python-chardet' 'python-humanfriendly' 'smartmontools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
sha512sums=('SKIP')
validpgpkeys=('5F6761715FB2876BF2355A72195598EC98A1C1DF') # Rafael Leira Osuna <rafael.leira@naudit.es> (https://github.com/ralequi.gpg) - expired

_sourcedirectory="$pkgname-$pkgver"

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
