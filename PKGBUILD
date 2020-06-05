# Maintainer:  Dave <orangechannel@pm.me>

_plug=lvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r311.aea5d2d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/lvsfunc'
license=('MIT')
depends=('vapoursynth'
         'vapoursynth-plugin-fvsfunc'
         'vapoursynth-plugin-havsfunc'
         'vapoursynth-plugin-kagefunc'
         'vapoursynth-plugin-mvsfunc'
         'vapoursynth-plugin-edi_rpow2-git'
         'vapoursynth-plugin-vstaambk'
         'vapoursynth-plugin-vsutil'
         )
optdepends=('vapoursynth-plugin-combmask: deinterlace.decomb'
            'vapoursynth-plugin-d2vsource: misc.source support for d2v sources'
            'vapoursynth-plugin-rgsf: 32-bit FLOAT clip support'
            'vapoursynth-plugin-readmpls: misc.source support for mpls sources'
            'vapoursynth-plugin-continuityfixer: misc.edgefixer'
            )
makedepends=('git'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/lvsfunc.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
#   install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
#   python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}/__init__.py"
#   python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
    python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
