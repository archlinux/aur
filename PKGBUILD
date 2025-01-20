# maintainer: sxxe@gmx.de

pkgname=python-radicale-decsync-git
pkgver=2.1.0.r1.g65ab71a
pkgrel=1
pkgdesc="Radicale storage plugin to add synchronization using DecSync (git storage discover branch fix) "
arch=('any')
url="https://github.com/mab122/Radicale-DecSync.git#branch=fix/storage_discovery_arguments_mismatch"
license=('GPL3')
depends=('python' 'python-libdecsync' 'radicale')
makedepends=('python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')

_dirname="Radicale-DecSync"

pkgver() {
  cd "${srcdir}/${_dirname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
  rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}

