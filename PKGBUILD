# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=sca2d
pkgname="python-${_name}"
pkgver=0.3.1
pkgrel=2
pkgdesc='Static Code Analysis for SCAD'
arch=('any')
url='https://gitlab.com/bath_open_instrumentation_group/sca2d'
makedepends=('python-hatchling')
license=('GPL3')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=(
  'python' 'python-lark-parser' 'python-colorama' 'python-pygments' 'python-jinja' 'python-markdown'
  )
source=(
  "https://files.pythonhosted.org/packages/0b/7b/defe4edbabaf47c4af5663bdda49ff9016678b26f9c77d302424be08cde0/${_name}-${pkgver}.tar.gz"
  fix-lark.patch
)
sha256sums=(
  548652491d50d8becfe599d8aac9dc719c2b3b5a3d89744e5dae6ea516d337f0
  214ee5edd3a9443c861cf64a9a37fd7c8f61003cec1a45e2ca40b9260ae1a0b8
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  patch -p1 -i "${srcdir}/fix-lark.patch"
  python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" "dist/${_name}-${pkgver}-py3-none-any.whl"
}
