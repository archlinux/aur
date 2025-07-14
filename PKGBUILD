# Maintainer: Max1Truc <max1truc@disroot.org>
# Adapted from https://gitlab.alpinelinux.org/alpine/aports/-/blob/5eda3cc22d0f1657c9c616545464b9497a35c265/community/virt-lightning/APKBUILD

pkgname=virt-lightning
pkgver=2.3.2
pkgrel=1
pkgdesc="A tool to start libvirt VMs in a couple of seconds"
url="https://github.com/virt-lightning/virt-lightning"
arch=(any)
license=("Apache-2.0")
depends=("python" "libvirt-python" "python-yaml")
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools-scm')
provides=("$pkgname" "vl")
source=("$pkgname-$pkgver.tar.gz::https://github.com/virt-lightning/virt-lightning/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d89d05116f9bd21a8d90adcf5bfaa6f60752f63cdd9cb2fd73bd6f729bbd94e9')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE-2.0.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 changelog.md README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
}
