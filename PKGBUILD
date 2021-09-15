#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=st-opinionated
pkgver=0.8.4
pkgrel=2
pkgdesc="simple terminal with some opinionated picked patches"
license=("custom")
arch=("any")
url="https://st.suckless.org/"
depends=(
  "libx11"
  "libxft"
)

source=(
  "https://st.suckless.org/patches/desktopentry/st-desktopentry-0.8.4.diff"
  "https://st.suckless.org/patches/bold-is-not-bright/st-bold-is-not-bright-20190127-3be4cf1.diff"
  "https://st.suckless.org/patches/csi_22_23/st-csi_22_23-0.8.4.diff"
  "https://st.suckless.org/patches/font2/st-font2-20190416-ba72400.diff"
  "https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff"
  "https://st.suckless.org/patches/anysize/st-anysize-0.8.4.diff"
  "https://raw.githubusercontent.com/cog1to/st-ligatures/e31975933b5495e5ed031c54c7e331eae70d4f8e/0.8.4/st-ligatures-alpha-20210824-0.8.4.diff"
  "https://dl.suckless.org/st/st-0.8.4.tar.gz"
  "config.h"
)

prepare() {
  cd "st-$pkgver"
  make clean
  cp -r "$srcdir/config.h" ./config.h
  patch -i "$srcdir/st-desktopentry-0.8.4.diff"
  patch -i "$srcdir/st-csi_22_23-0.8.4.diff"
  patch -i "$srcdir/st-bold-is-not-bright-20190127-3be4cf1.diff"
  patch -i "$srcdir/st-font2-20190416-ba72400.diff"
  patch -i "$srcdir/st-anysize-0.8.4.diff"
  patch -i "$srcdir/st-alpha-0.8.2.diff"
  patch -i "$srcdir/st-ligatures-alpha-20210824-0.8.4.diff"
  echo 'PREFIX = /usr' >> config.mk
  echo 'MANPREFIX = /usr/share/man' >> config.mk
}

build() {
  cd "st-$pkgver"
  make st
}

package() {
  cd "st-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/st/LICENSE"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('12d633b2157444d192e5645c9914a0fd82d52289a868d35dfa4c09db5670ffb3'
            '329169acac7ceaf901995d6e0897913089b799d8cd150c7f04c902f4a5b8eab2'
            'cdbcd3b70d9f8b51ebe664b816615eef2ce520ecfc999723166e3cb3f0999a8d'
            '7279c787dba23d72a8a0a4613c0917e03d0087f0254f56a530cd9c521857d20b'
            '9c5b4b4f23de80de78ca5ec3739dc6ce5e7f72666186cf4a9c6b614ac90fb285'
            '3851f7919e788cc6667ffdb28ca743188e2869a15f3fc34a8c0b39108d946ef0'
            '4218e69bb27c2cea680964178672068a04ac84fc09c76588c25c4177ee1d77bd'
            'd42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6'
            'SKIP')
