# Previous Maintainer: Oscar Morante <spacepluk@gmail.com>
# Current Maintaner: Bu Domino <bu.domino@gmail.com>

_prefix=/opt/UnityLts
_hash=6dd1c08eedfa

pkgname=unity-editor-lts-windows
pkgver=2019.4.20f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("$pkgver.pkg::https://download.unity3d.com/download_unity/${_hash}/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-$pkgver.pkg")
md5sums=('ac48a0e7a47d6505c2cf3df64634361d')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}
