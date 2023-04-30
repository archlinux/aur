# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: David Becker <dasmau89@gmail.com>
pkgname=freegemas
pkgver=22.02
pkgrel=1
pkgdesc="An open source version of the well known Bejeweled written in C++ using SDL2"
arch=('x86_64')
url="https://github.com/JoseTomasTocino/freegemas"
license=('GPL2')
depends=('jsoncpp' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('916fb537fb836fd6d08a31aff8d351a9d54cf70bd13aaba31d376a55797cca55'
            'dbe382b8d8d6457fd452430a323171b818c72bf0a5c232e89e551149aa890202')

build(){
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  install -Dm755 "build/$pkgname" -t "$pkgdir/opt/$pkgname/"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin"/

  cd "$pkgname-$pkgver"
  install -Dm644 "platform/unix/icons/64x64/$pkgname.png" -t \
    "$pkgdir/usr/share/pixmaps/"
  cp -a media "$pkgdir/opt/$pkgname/"
}
