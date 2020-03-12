# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=mpy-repl-tool-git
_pkgname="${pkgname%-git}"
pkgver=r139.0f4a716
pkgrel=1
pkgdesc="Communicate and transfer files from and to MicroyPython boards via REPL"
arch=('any')
url="https://github.com/zsquareplusc/mpy-repl-tool"
license=('custom')
depends=(python-pyserial python-colorama)
makedepends=(python-setuptools)
optdepends=('python-fusepy: for mounting the micropython filesystem')
conflicts=(mpy-repl-tool)
provides=(mpy-repl-tool)
source=('git+https://github.com/zsquareplusc/mpy-repl-tool.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
