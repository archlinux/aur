# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>
# Maintainer:  kageru <kageru[at]encode[dot]moe>

_plug=kagefunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r61.ee61e8f
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/kagefunc'
license=('GPL')
depends=('vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-fvsfunc-git'
         'vapoursynth-plugin-retinex-git'
         'vapoursynth-plugin-vsutil-git'
         'vapoursynth-plugin-descale-git'
         'vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-wwxd-git'
         'vapoursynth-plugin-addgrain-git'
         'vapoursynth-plugin-bm3d-git'
         'vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-adaptivegrain-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/kagefunc.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
