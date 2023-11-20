# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=plasma5-applets-uswitch
pkgver=1.3.0
pkgrel=2
pkgdesc='Modified version of User Switch plasmoid'
url='https://gitlab.com/divinae/uswitch'
license=('GPL3')
arch=('any')
depends=('plasma-workspace')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kcoreaddons5')
provides=('plasma5-applets-uswitch')
conflicts=('plasma5-applets-uswitch')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/divinae/uswitch/-/archive/$pkgver/uswitch-$pkgver.tar.gz")
sha256sums=('e861467b1161b2080d05bd4af764c0d4d956c7501c148c4a1f9a7a05e14d18f9')
b2sums=('0ea0accc84c999b814c6e31c81fe5021c1db423694324cd08ce1a52827d58bd306cc73d10df1c720124b1d89555261bed2250efe4f6d34187f03f2c723555faf')

prepare() {
  cd "uswitch-$pkgver"

  cd package
  desktoptojson -i metadata.desktop

  mkdir -p plasmoid
  mv -t plasmoid metadata.json contents
}

build() {
  cd "uswitch-$pkgver"

  cmake -S package -B build \
    -W no-dev \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=RelWithDeb \
    -D KDE_INSTALL_LIBDIR=lib \
    -D KDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build build
}

package() {
  cd "uswitch-$pkgver"

  cmake --install build --prefix "${pkgdir}/usr"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
