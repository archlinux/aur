# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.4.2'
_commit='d1db1071d9732d088fa64f3cff2f6223e1cdc830'
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
b2sums=('ef1515a26f86895d8ec026bf45eb85bf2abe913aee056791db1aacfe12fd8b5d48a68274f787db7b8c55b7a24d545ea7c2b426612fdd61fd8d80f43d1b11357f')
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
