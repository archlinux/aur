# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=ryzenadj-controller-git
_pkgbase=ryzenadj-controller
pkgver=1.0.0.r3.g728d6b1
pkgrel=1
pkgdesc="Python module that provides a userspace interface for RyzenAdj using Unix Sockets"
arch=('x86_64')
url="https://github.com/ShadowBlip/ryzenadj-controller"
license=('GPL')
groups=()
depends=('python' 'ryzenadj-git')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("${_pkgbase}::git+https://github.com/ShadowBlip/${_pkgbase}.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgbase}"
}

build() {
	cd "$srcdir/${_pkgbase}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_pkgbase}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	mkdir -p ${pkgdir}/usr/lib/systemd/system
	install -m644 systemd/ryzenadj-controller.service ${pkgdir}/usr/lib/systemd/system
}
