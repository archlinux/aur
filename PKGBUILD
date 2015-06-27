# Maintainer: Zachary Jaggi <feilen1000@gmail.com>

_oculusver=0.5.0.1
pkgver=0.5.0.1.r0.ebfb6b3
pkgrel=2
_basename='oculus-wine-wrapper'
pkgname=${_basename}-git
pkgdesc='A wrapper to allow you to run Oculus Rift Windows games in Wine'
arch=('x86_64')
url='https://jspenguin.org'
license=('MIT')
depends=('oculus-rift-sdk>=0.5.0.1'
		 'wine')
makedepends=('mingw-w64-gcc'
			 'mingw-w64-binutils')
optdepends=('oculus-udev: Rules to let users access the Oculus Rift'
			'wine-unity3d-git: Wine with a patch allowing the -force-opengl flag of unity to work')
options=('!emptydirs')
source=("${_basename}::git+https://github.com/feilen/${_basename}.git")
sha256sums=('SKIP')
conflicts=('oculus-wine-wrapper')

pkgver() {
  cd ${srcdir}/${_basename}

  printf "%s.r%s.%s" "${_oculusver}" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_basename}

  rm -f *.so *.exe

  make
}

package() {
  cd ${srcdir}/${_basename}

  install -dm 755 ${pkgdir}/usr/share/oculus-wine-wrapper
  install -dm 755 ${pkgdir}/usr/bin

  install -m 755 oculus_shm_adapter.exe ${pkgdir}/usr/share/oculus-wine-wrapper/oculus_shm_adapter.exe
  install -m 755 no_xselectinput.so ${pkgdir}/usr/share/oculus-wine-wrapper/no_xselectinput.so

  install -m 755 oculus_wine_wrapper.sh ${pkgdir}/usr/bin/oculus-wine-wrapper
}
