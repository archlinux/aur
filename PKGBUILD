# Maintainer: DrRac27 <drrac27 at riseup dot net>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Florian Schweikert <kelvan@ist-total.org>

pkgname=python-pyotherside-moment-git
_pyname=pyotherside
pkgver=1.6.1.r2.302c111
pkgrel=1
pkgdesc='Asynchronous Python 3 Bindings for Qt5 (patched for Moment)'
arch=('x86_64')
url='https://thp.io/2011/pyotherside'
license=('ISC')
depends=('python' 'qt5-base' 'qt5-declarative' 'qt5-svg')
source=("git+https://github.com/thp/${_pyname}.git")
sha256sums=('SKIP')
provides=(python-pyotherside)
conflicts=(python-pyotherside)

pkgver() {
	cd "${srcdir}/${_pyname}"
	local tag=$(git tag --sort=-v:refname | grep -v packaging | head -1)
	local commits_since=$(git rev-list $tag..HEAD --count)
	echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
	cd "${srcdir}/${_pyname}"

	qmake-qt5
	make
}

package() {
	cd "${srcdir}/${_pyname}"

	make INSTALL_ROOT="${pkgdir}/" install

	rm -r "${pkgdir}/usr/tests"
}
