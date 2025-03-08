# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vstaambk
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.8.2.2.gfef19f8
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk'
license=('GPL')
depends=(
  'vapoursynth-plugin-eedi2-git'
  'vapoursynth-plugin-nnedi3-git'
  'vapoursynth-plugin-eedi3m-git'
  'vapoursynth-plugin-mvtools'
  'vapoursynth-plugin-fmtconv-git'
  'vapoursynth-plugin-sangnom-git'
  'vapoursynth-plugin-tcanny-git'
  'vapoursynth-plugin-msmoosh-git'
  'vapoursynth-plugin-awarpsharp2-git'
)
optdepends=(
  'vapoursynth-plugin-nnedi3cl-git'
  'vapoursynth-plugin-znedi3-git'
  'vapoursynth-plugin-eedi2cuda-git'
  'vapoursynth-plugin-havsfunc-git'
  'vapoursynth-plugin-mvsfunc-git'
)
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d 'v')"
}

package() {
  cd "${_plug}"
  install -Dm644 vsTAAmbk.py "${pkgdir}${_site_packages}/vsTAAmbk.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/vsTAAmbk.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/vsTAAmbk.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
