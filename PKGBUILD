# Maintainer: X0rg

pkgname=obs-service-tar_scm
pkgver=0.10.22
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
sha512sums=('974f407c2d603cdcd1c300d0442ab34c9233b2925565fa36644d32994735611c53c531d45a4067e0f9caa1d1774648554c783334884be8e772b7f1575275f063')

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
