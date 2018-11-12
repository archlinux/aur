# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b9
_randomstring=a3326ae325b2
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-mac
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Mac platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("https://beta.unity3d.com/download/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Mac-Mono-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('7ec18e4475c718a0f67bced2a31c6f4a4b9ba27e')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

