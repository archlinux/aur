# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=finesharp
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r9
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT Version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=166524'
license=('GPL')
depends=('vapoursynth')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
makedepends=('git')
source=("${_plug}::git+https://gist.github.com/8676fd350d4b5b223ab9.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
