# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=warpsharpsupport
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R1.0.g42f3b5e
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/myrsloik/WarpSharpSupport.git'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
source=("${_plug}::git+https://github.com/myrsloik/WarpSharpSupport.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package() {
  install -Dm644 "${_plug}/wss.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
