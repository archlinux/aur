# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: X0rg

pkgname=obs-service-tar_scm
pkgver=0.10.41
pkgrel=1
pkgdesc="Source Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-tar_scm"
license=('GPL2')
groups=('obs')
depends=('obs-build'
	'python'
	'python-pyaml'
	'python-dateutil')
checkdepends=('flake8'
	'python-mock'
	'python-pylint'
	'python-dulwich'
	'cpio'
	'git'
	'subversion'
	'mercurial'
	'bzr')
optdepends=('cpio: needed for running properly the obs_scm source service'
	'git: git repo support'
	'subversion: svn repo support'
	'mercurial: hg repo support'
	'bzr: bzr repo support')
backup=("etc/obs/services/tar_scm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-tar_scm/archive/$pkgver.tar.gz")
sha512sums=('2f7c3b807ee9d2735330db7dbae5eac71e2a344c37276ab31941576693dfcceb6524f50d055cbb23bfc081a8152f645d4981a25a31a7c3dc07cd17be93a50c8f')

check() {
	cd "$srcdir/$pkgname-$pkgver"
	if [[ -d "tests/tmp" ]]; then
		rm -rf "tests/tmp"
	fi
	make check3
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
