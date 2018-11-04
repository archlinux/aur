# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.14
_build=f1
_randomstring=b28150134d55
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-windows
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-${_version}${_build}.pkg")
md5sums=('3fe986d2544ecef6f6c55b6dbeddf015')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

