# Maintainer : Yamashita Ren
# Contributor:  Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vapoursynth-plugin-edi_rpow2-git
pkgver=r29.2a20385
pkgrel=1
pkgdesc="Plugins for Vapoursynth : nnedi3_rpow2, znedi3_rpow2, nnedi3cl_rpow2, eedi3_rpow2 and eedi2_rpow2"
arch=('any')
url="http://forum.doom9.org/showthread.php?t=172652"
license=('custom:WTFPL')
depends=('vapoursynth')
optdepends=('vapoursynth-plugin-eedi2-git: needed for eedi2_rpow2'
            'vapoursynth-plugin-nnedi3-git: needed for nnedi3_rpow2'
            'vapoursynth-plugin-nnedi3cl-git: needed for nnedi3cl_rpow2'
            'vapoursynth-plugin-znedi3-git: needed for znedi3_rpow2')
makedepends=('git')
source=("$pkgname"::"git+https://gist.github.com/020c497524e794779d9c.git")
sha1sums=('SKIP')
_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm644 "edi_rpow2.py" "${pkgdir}${_site_packages}/edi_rpow2.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/edi_rpow2.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/edi_rpow2.py"
}
