# Maintainer: Modelmat <modelmat@outlook.com.au>

pkgname=python-frccontrol-git
pkgver=2025.5
pkgrel=1
pkgdesc="Provides SciPy wrappers that ease development of state-space models for the FIRST Robotics Competition."
arch=("x86_64")
url="https://github.com/calcmogul/frccontrol.git"
license=("BSD")
depends=("python-matplotlib" "python-numpy" "python-scipy")
makedepends=('python-build' 'python-installer' 'python-pytest')
source=(git+https://github.com/calcmogul/frccontrol.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/frccontrol"
  year=$(date +%Y)
  echo $year.$(git rev-list --count --after="main@{$(($year - 1))-01-01}" main)
}

build() {
  cd "${srcdir}/frccontrol"
  python -m build --wheel
}

check() {
  cd "${srcdir}/frccontrol"
  pytest
}

package() {
  cd "${srcdir}/frccontrol"
  pip install dist/frccontrol-*.whl --no-deps --root ${pkgdir} --ignore-installed
}
