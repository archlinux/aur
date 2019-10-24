# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-android
pkgver=2019.3.0b8
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
source=("2019.3.0b8.3.0b8.pkg::https://beta.unity3d.com/download/7eb5456f98b4/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.3.0b8.pkg")
md5sums=("65360685628eeff8ef2899b64fa00d2e")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

