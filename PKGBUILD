# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=10.f9b1775
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://gitlab.com/shssoichiro/soifunc'
license=('MIT')
depends=('vapoursynth'
  'vapoursynth-plugin-vsutil'
  'vapoursynth-plugin-muvsfunc'
  'vapoursynth-plugin-mvsfunc'
  'vapoursynth-plugin-kagefunc'
  'vapoursynth-plugin-debandshit'
  'vapoursynth-plugin-neo_f3kdb'
  'vapoursynth-plugin-nnedi3_resample'
  'vapoursynth-plugin-znedi3'
)
optdepends=('vapoursynth-plugin-bm3dcuda: Fast BM3D cuda/cuda_rtc/cpu support')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://gitlab.com/shssoichiro/soifunc.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.%s" "$_rev" "$_hash"
}

package() {
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
