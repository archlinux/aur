# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.4.0'
_commit='aaffe589f2638f201ab307e85519f6b74198116d'
pkgrel='2'
epoch='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL-2.1-or-later')
depends=('python>=3.8.0' 'python-chardet' 'python-humanfriendly' 'smartmontools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
b2sums=('21d6f710e1564215beac6810ac87263a665d54d6d383b7f43fbd2236e6cf5ea07cc62a85af6611741c6be81da7556165ea07e29b7cf2a7afef68c65a373c9b78')
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
