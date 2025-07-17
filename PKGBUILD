# Maintainer: graysky <therealgraysky AT protonmail DOT com>
pkgname=psrecord
pkgver=1.4
pkgrel=2
pkgdesc="Record and plot the CPU and memory activity of a process."
arch=(any)
url="https://github.com/astrofrog/psrecord"
license=(BSD)
depends=(python-psutil)
checkdepends=(python-matplotlib)
makedepends=(python-pytest python-setuptools-scm python-build python-installer python-wheel python-setuptools)
optdepends=('python-matplotlib: to generate plots of the data')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrofrog/psrecord/archive/v$pkgver.tar.gz")
b2sums=('70868e0f3af86b6138c9f7effa95590bce08743adecb30aaafa128c0062d709cb8579004d5c587c326048f32aeeae5bd6993df72c0fa6adcbddd8415bc325f9e')

build() {
  cd "$pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
