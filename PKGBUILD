# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mcdegrainsharp
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r6.abdc093
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://gist.github.com/4re'
license=('GPL')
depends=('vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-mvtools'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://gist.github.com/b5399b1801072458fc80.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
