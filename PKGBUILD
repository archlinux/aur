# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b3
_randomstring=cc0086a8e10c
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-windows
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("https://beta.unity3d.com/download/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('3d08d57850f0089c152aa19a19ac5b2764715f6d')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

