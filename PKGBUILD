# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b4
_randomstring=44012bad7987
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-android
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Android platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'android-platform'
         'android-sdk-build-tools'
         'android-udev')
optdepends=('android-ndk-13b: needed for IL2CPP builds')
makedepends=('cpio')
source=("https://beta.unity3d.com/download/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('0d5ee2ef9c96b96d4b188f6a064345046070a5da')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

