# Maintainer:  Dave <orangechannel@pm.me>

_plug=acsuite
pkgname=vapoursynth-tools-${_plug}-git
pkgver=v3.0.0.0.gc14204b
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/OrangeChannel/acsuite'
license=('GPL')
depends=('vapoursynth'
         'mkvtoolnix-cli'
         )
makedepends=('git')
provides=("vapoursynth-tools-${_plug}"
          "vapoursynth-plugin-${_plug}"
          )
conflicts=("vapoursynth-tools-${_plug}"
           "vapoursynth-plugin-${_plug}"
           )
source=("${_plug}::git+https://github.com/OrangeChannel/acsuite.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
