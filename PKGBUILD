# Maintainer: Adam <classygopher@gmail.com>
pkgname=bolt-launcher
pkgver=0.7.0
pkgrel=1
pkgdesc="Free, open-source, third-party implementation of the Jagex launcher"
license=('AGPL3')
url="https://bolt.adamcake.com/"
arch=('x86_64')
depends=(libx11 libxcb libarchive gtk3)
makedepends=(git cmake ninja gcc pkg-config)
optdepends=('jre17-openjdk: runelite/hdos' 'gtk2: rs3' 'openssl-1.1: rs3')
source=("git+https://github.com/Adamcake/Bolt.git#tag=${pkgver}"
        "https://adamcake.com/cef/cef-114.0.5735.134-linux-x86_64-minimal-ungoogled.tar.gz")
sha256sums=('SKIP'
            '72c8c43dcb61f778a807eb262b2c2ebcb2e1705756de5a9003484af0663aa924')

prepare() {
  git -C Bolt submodule update --init --recursive
}

build() {
  cmake -S Bolt -B build -G Ninja -D CMAKE_BUILD_TYPE=Release -D CEF_ROOT="$srcdir"/cef_binary_114.2.11+g87c8807+chromium-114.0.5735.134_linux64_minimal -D CMAKE_INSTALL_PREFIX="$pkgdir" -D BOLT_META_NAME="$pkgname"
  cmake --build build
}

package() {
  cmake --install build
}
