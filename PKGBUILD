# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b1
_randomstring=3f0ac31c6d6f
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-windows
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("https://beta.unity3d.com/download/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('304fedca8da8f525f31402eaeefdc6d6c6a42e89')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

