# Maintainer: prg <prg _at_ xannode _dot_ com>
# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=haruna
pkgver=0.9.0
pkgrel=1
pkgdesc='Video player built with Qt/QML on top of libmpv.'
arch=('x86_64')
url='https://invent.kde.org/multimedia/haruna/'
license=('GPL3')
depends=('kfilemetadata' 'kio' 'mpv' 'qt5-quickcontrols2' 'kirigami2' 'breeze-icons')
makedepends=('extra-cmake-modules' 'kdoctools')
source=("$url/-/archive/v$pkgver/haruna-v$pkgver.tar.gz")
sha256sums=('7bd4a4693b3e609ae9833375421c4d87a58ce54b39c90b34bb3a0cd547ada35b')

build() {
  export CFLAGS+=" $CPPFLAGS"
  export CXXFLAGS+=" $CPPFLAGS"
  cmake -B 'build' -S "$pkgname-v$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="$pkgdir" PREFIX='/usr' -C 'build' install
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" "$pkgname-v$pkgver/README.md"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-v$pkgver/LICENSES"/*
}

# vim: ts=2 sw=2 et:
