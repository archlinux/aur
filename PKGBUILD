# Maintainer:  Dave <orangechannel@pm.me>

_tool=genstubs
pkgname=vapoursynth-tools-${_tool}-git
pkgver=r459.4176ac7
pkgrel=1
pkgdesc="Generates stub files for the VapourSynth Python module and plugins"
arch=('x86_64')
url='https://github.com/vapoursynth/vsrepo'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
             'python-setuptools'
             )
provides=("vapoursynth-tools-${_tool}")
conflicts=("vapoursynth-tools-${_tool}")
source=("${_tool}::git+https://github.com/vapoursynth/vsrepo.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_tool}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_tool}"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_tool}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
