# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

_pkgname=android-cmake
_github_addr=taka-no-me/android-cmake
pkgname=$_pkgname-git
pkgver=r147.556cc14
pkgrel=1
pkgdesc="CMake toolchain file and other scripts for the Android NDK"
arch=('any')
license=('custom:BSD')
url='https://github.com/taka-no-me/android-cmake'
depends=('cmake>=2.8.9' 'android-ndk>=r5')
makedepends=('git')
source=("$_pkgname"::"git+https://github.com/$_github_addr")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$srcdir/$_pkgname"
    install -dDm755 "${pkgdir}/opt/$_pkgname"
    install -Dm644 AndroidNdkGdb.cmake "${pkgdir}/opt/$_pkgname/AndroidNdkGdb.cmake"
    install -Dm644 AndroidNdkModules.cmake "${pkgdir}/opt/$_pkgname/AndroidNdkModules.cmake"
    install -Dm644 android.toolchain.cmake "${pkgdir}/opt/$_pkgname/android.toolchain.cmake"
}
