# Maintainer: caiye <ye[dot]jingchen[at]gmail[dot]com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

_projname=librime
pkgname=librime-octagram
pkgver=1.5.3
pkgrel=1
epoch=1
pkgdesc="Rime input method engine, with octagram plugin"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'google-glog' 'marisa')
optdepends=('plum: preset input schemas'
            'plum-extra: extra input schemas')
makedepends=('cmake' 'boost' 'gtest' 'git')
conflicts=('librime')
provides=('librime')
source=("$_projname-$pkgver.tar.gz::https://github.com/rime/librime/archive/$pkgver.tar.gz"
        "git+https://github.com/lotem/librime-octagram")
sha512sums=('4d7f6ec43bd5728f59f0b3581bcd8a46128651430b6873017d80659942b8f6aa1a2f25f439ba8fba461fe22acbf701c2da7a786104a2e4852a70a89cdc0452d3'
            'SKIP')

prepare() {
  cd $_projname-$pkgver/plugins
  if [[ ! -e librime-octagram ]]; then
    git clone "$srcdir/librime-octagram"
  else
    (cd librime-octagram && git pull)
  fi
}

build() {
  cd $_projname-$pkgver
  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $_projname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
