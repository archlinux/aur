# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=midna-theme
pkgver=6.1.1
_commit=abd08ad19796028c179c3881e9d9a81c4d13ac68
pkgrel=1
pkgdesc='KaOS Plasma 5 Look & Feel theme files'
url='https://github.com/KaOSx/midna'
arch=('x86_64')
license=('LGPL')
depends=('plasma-framework5' 'ttf-raleway' 'kvantum')
makedepends=('extra-cmake-modules')
conflicts=('kde-kdm-themes-midna'
           'kde-ksplash-themes-midna'
           'kde-plasma-themes-midna'
           'midna-colors'
           'wallpapers-midna'
           'plasma-midna-theme-git')
replaces=('kde-kdm-themes-midna'
          'kde-ksplash-themes-midna'
          'kde-plasma-themes-midna'
          'midna-colors'
          'wallpapers-midna')
source=("https://github.com/KaOSx/midna/archive/${_commit}.zip")
b2sums=('a371bed70220f7b5ac9ff31c11f16d486ce4bd8bbfd9279106dc3c347ad8e506f4df6eac88b0aac5a49becccd0de25988be427c4c84ff71faa326e59ae26836e')

prepare() {
  cd midna-${_commit}

  sed -i -e 's|WALLPAPER_INSTALL_DIR|KDE_INSTALL_WALLPAPERDIR|' wallpapers/CMakeLists.txt
}

build() {
  cmake -B build -S midna-${_commit} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package() {

  DESTDIR=${pkgdir} cmake --install build
}
