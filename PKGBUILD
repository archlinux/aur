# Maintainer: Modelmat <modelmat@outlook.com.au>

pkgname=python-frccontrol-git
pkgver=2023.13
pkgrel=1
pkgdesc="Provides SciPy wrappers that ease development of state-space models for the FIRST Robotics Competition."
arch=("x86_64")
url="https://github.com/calcmogul/frccontrol.git"
license=("BSD")
depends=("python-matplotlib" "python-numpy" "python-scipy")
source=(${pkgname}::"git+https://github.com/calcmogul/frccontrol.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  year=$(date +%Y)
  echo $year.$(git rev-list --count --after="main@{$(($year - 1))-01-01}" main)
}

check() {
  cd "${srcdir}/${pkgname}"
  python setup.py test
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --skip-build
}
