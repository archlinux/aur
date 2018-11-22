# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.16
_build=f1
_randomstring=39a4ac3d51f6
_prefix=/opt/Unity

pkgname=unity-editor-mac
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Mac platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Mac-Mono-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('852c4847e69ff44ec2c67ae60cdb0735880d8eb7')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

