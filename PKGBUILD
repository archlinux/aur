# Maintainer: Valentijn "noirscape" V. <neko at catgirlsin dot space>
# Contributor: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityLts
_hash=5da6f0345e82

pkgname=unity-editor-lts-android
pkgver=2019.4.24f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Android platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'android-platform'
         'android-sdk-build-tools'
         'android-udev')
makedepends=('cpio')
optdepends=('android-ndk-13b: needed for IL2CPP builds')
source=("$pkgver.pkg::https://download.unity3d.com/download_unity/${_hash}/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-$pkgver.pkg")
md5sums=('ced00572832b7d2abe76dddcd19d255b')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

