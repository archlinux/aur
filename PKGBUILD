# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.4.0'
_commit='aaffe589f2638f201ab307e85519f6b74198116d'
pkgrel='1'
epoch='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL-2.1-or-later')
depends=('python>=3.8.0' 'python-chardet' 'python-humanfriendly' 'smartmontools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
sha512sums=('847d6ed1d5992f4baf12b8bd93888987405ebb36b01b9e4b028b1ec90c8a5d72eabb84c7ae41a56aef27f363153c9acf5527179a0ed1db83644f20be6dfe6cdb')
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
