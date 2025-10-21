# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: X0rg

pkgname=obs-service-tar_scm
pkgver=0.11.0
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
sha512sums=('6390949c8d4d3d5a5959d0b925d08bd7f838a6305d40724bfe7330013dae7fc8f7edc85e9872ddebee9094041de22eaaa0654f86afce7194a49890e4bf64c0dc')

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
