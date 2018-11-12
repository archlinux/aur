# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.15
_build=f1
_randomstring=65e0713a5949
_prefix=/opt/Unity

pkgname=unity-editor-windows
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('6ad9394899468840002e7aafbf38103c5bcfe7c2')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

