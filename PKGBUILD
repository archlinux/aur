# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-android
pkgver=2019.3.0f3
pkgrel=1
pkgdesc="Allows building your Unity projects for the Android platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'android-platform'
         'android-sdk-build-tools'
         'android-udev')
optdepends=('android-ndk-16b: needed for IL2CPP builds')
makedepends=('cpio')
source=("2019.3.0f3.3.0f3.pkg::https://beta.unity3d.com/download/6c9e2bfd6f81/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.3.0f3.pkg")
md5sums=("5add67766b4b6615d7926dee80adfd8c")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

