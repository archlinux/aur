# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tcpclip
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.4.0.1.gd7b3c1a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Beatrice-Raws/VapourSynth-TCPClip'
license=('MIT')
depends=('python-numpy')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Beatrice-Raws/VapourSynth-TCPClip.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"
  install -Dm644 TCPClip.py "${pkgdir}${_site_packages}/TCPClip.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/TCPClip.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/TCPClip.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
