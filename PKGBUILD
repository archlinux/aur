# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.17
_build=f1
_randomstring=05307cddbb71
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-mac
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Mac platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Mac-Support-for-Editor-${_version}${_build}.pkg")
md5sums=('7cf6d914d507ef35b98643bdfd84f7ee')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

