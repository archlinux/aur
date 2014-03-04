# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=ecwolf
pkgver=1.2.3
pkgrel=1
pkgdesc='Advanced source port of "Wolfenstein 3D" and "Spear of Destiny" based on Wolf4SDL'
arch=('i686' 'x86_64')
url="http://maniacsvault.net/ecwolf"
license=('GPL')
depends=('sdl_mixer' 'libjpeg' 'gtk2')
makedepends=('cmake')
install=$pkgname.install
source=("http://maniacsvault.net/ecwolf/files/ecwolf/1.x/ecwolf-$pkgver-src.7z")
sha256sums=('41ba154bfef4c09282d63c93f7696771458276096ea5bc9f03f0867a05a2864a')

prepare() {
  cd ecwolf-$pkgver-src/src

  # data dir hack
  sed -e 's|OpenResourceFile(datawad|OpenResourceFile(FString("/usr/share/ecwolf/") + datawad|' \
    -e 's|wadfiles.Push("ecwolf.pk3|wadfiles.Push("/usr/share/ecwolf/ecwolf.pk3|' -i wl_iwad.cpp
}

build() {
  cd ecwolf-$pkgver-src

  # enable gpl licensed opl emulator
  cmake ./ -DGPL=ON
  make
}

package() {
  cd ecwolf-$pkgver-src

  # binary + data
  install -Dm755 ecwolf "$pkgdir"/usr/bin/ecwolf
  install -Dm644 ecwolf.pk3 "$pkgdir"/usr/share/ecwolf/ecwolf.pk3
}
