# Maintainer: Niklas <dev@n1klas.net>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-sseclient
pkgver=0.0.26
pkgrel=1
pkgdesc="Client library for reading Server Sent Event streams"
arch=('any')
url="https://github.com/btubbs/sseclient"
license=('MIT')
depends=('python-requests>=2.0.0' 'python-six')
makedepends=('python-setuptools' 'git')
source=("git+${url}.git#tag=v${pkgver}"
	"version.patch::https://github.com/btubbs/sseclient/commit/a59411431415586db8a46ad9fb8c398a37ee0543.patch")
sha512sums=('SKIP'
            '6eabcb54fb125cfe7b50c8eff970ead747f696d956cf3b25b13ef082fd4946dc837d376cf761a94dc120c395b315e628e41f230dcbd376e3c8ae69e0064e7f21')

prepare() {
  cd "$srcdir/sseclient"
  for _patch in "$srcdir"/*.patch ; do
  	git apply --stat "$_patch"
  done
}

build() {
  cd "$srcdir/sseclient"
    python setup.py build
}

package() {
  cd "$srcdir/sseclient"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
