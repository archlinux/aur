# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.23
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL3')
depends=('gtkmm3' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-install-directories.patch")
sha512sums=('b6c28d467e24a1594a0713ffca8183b03022a96b59fa806b7c1a5f473d414b696d66464bef50724b8f1cb5375989bc5cee14bc1688c956dcb93ffe0acc5283cb'
            '602f53bfd4c4c49824400a36e4655dc6f6d5692b7277489f8e5f9f9d9d4d90eb086a4d142736e76edc2c8864430d8cbf5fa403bb25497b2c6a510a1979fe7650')

prepare() {
  cd FreeDoko_$pkgver
  patch -Np1 < ../freedoko-install-directories.patch

  # disable manual binary stripping
  sed -i '/$(MAKE) strip/d' src/Makefile
}

build() {
  cd FreeDoko_$pkgver

  export CXXFLAGS+=' -std=c++17'

  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver
  make DESTDIR="$pkgdir" install
}
