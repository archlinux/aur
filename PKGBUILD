# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.15
_build=f1
_randomstring=65e0713a5949
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
sha1sums=('c7757e9f477ebb3aecf4866e8431e1a4d3cb6ee2')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

