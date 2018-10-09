# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.11
_build=f1
_randomstring=38bd7dec5000
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
sha1sums=('13e4430be6c9695626c52c16bdd48413157333c4')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

