# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2017.3.0
_build=b1
_buildtag=20170926
_randomstring=2ca68d182788
_prefix=/opt/UnityBeta
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepdownloads=yes

pkgname=unity-editor-beta-android
pkgver=${_version}${_build}+${_buildtag}
pkgrel=2
pkgdesc="Allows building your Unity projects for the Android platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'android-platform'
         'android-sdk-build-tools'
         'android-udev')
optdepends=('android-ndk-13b: needed for IL2CPP builds')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}")
sha1sums=('2c7e3358f4833070ac5266b0abc90aea8f4875c8')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

unity-setup() {
  ./UnitySetup-${_version}${_build} -d "${startdir}" -l "${pkgdir}${_prefix}" -u $@
}

extract-component() {
  msg2 "Extracting $1..."
  yes | unity-setup -c $1 > "/tmp/$1.log"
}

prepare() {
  chmod +x "${srcdir}/UnitySetup-${_version}${_build}"
}

package() {
  mkdir -p "${pkgdir}${_prefix}"
  extract-component Android

  if [ -z "${_keepdownloads}" ]; then
    rm "${startdir}/UnitySetup-Android-Support-for-Editor-${_version}${_build}.pkg"
  fi
}

