# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=midna-theme
pkgver=7.0.2
_commit=10eda6404e1285bf6e1b531f29488f5c3b64a112
pkgrel=1
pkgdesc='KaOS Plasma 6 Look & Feel theme files'
url='https://github.com/KaOSx/midna'
arch=('x86_64')
license=('LGPL')
#depends=('plasma-framework5' 'ttf-raleway' 'kvantum')
depends=('libplasma' 'ttf-raleway' 'kvantum')
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
b2sums=('006a5a4399b5b5954fc0834f17dc208e8eb93cb3017fcd7a04d5e1122263a87ef1ac895986b914b3d5bf3700ac8e5b3df293510f1c4bb6f68b1cbe0454b6c52d')

prepare() {
  cd midna-${_commit}

  sed -i -e 's|WALLPAPER_INSTALL_DIR|KDE_INSTALL_WALLPAPERDIR|' wallpapers/CMakeLists.txt
}

build() {
  cmake -B build -S midna-${_commit} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {

  DESTDIR=${pkgdir} cmake --install build
}
