# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b5
_randomstring=01088ee0a3a8
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
sha1sums=('7d0338964b6e64f5b90cc1083f166c4b6c459870')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

