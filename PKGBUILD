# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.7
_build=f1
_randomstring=4ebd28dd9664
_prefix=/opt/Unity

pkgname=unity-editor-android
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Android platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'android-platform'
         'android-sdk-build-tools'
         'android-udev')
makedepends=('cpio')
optdepends=('android-ndk-13b: needed for IL2CPP builds')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('3cf9121b1b300854ae909735f94cea781b6c0e55')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

