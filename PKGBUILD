# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=libbtc-git
_pkgname=libbtc
_commit=07933995e
pkgver=0.1
pkgrel=1
pkgdesc='Tiny Bitcoin Library written in C with bitcointool CLI tool'
url='https://github.com/libbtc/libbtc'
arch=('x86_64')
license=('MIT')
source=("git+$url.git"
        "https://raw.githubusercontent.com/jahway603/libbtc/master/LICENSE")
sha256sums=('SKIP'
            '521d039fe41ccb983129b3a1d307ed7e413b4c4eb3d3c7616edd42633b588a11')

build() {
  cd ${_pkgname}
  git checkout ${_commit}
  echo "this will take some time so be patient..."
  echo "starting autogen..."
  ./autogen.sh
  echo "starting configure..."
  ./configure
  echo "starting compile..."
  make -j$(nproc)
}

package() {
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "$srcdir/${_pkgname}/bitcoin-send-tx" "$pkgdir/opt/${_pkgname}/bitcoin-send-tx"
  install -Dm755 "$srcdir/${_pkgname}/bitcoin-spv" "$pkgdir/opt/${_pkgname}/bitcoin-spv"
  install -Dm755 "$srcdir/${_pkgname}/bitcointool" "$pkgdir/opt/${_pkgname}/bitcointool"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/${_pkgname}/bitcoin-send-tx "$pkgdir/usr/bin"
  ln -s /opt/${_pkgname}/bitcoin-spv "$pkgdir/usr/bin"
  ln -s /opt/${_pkgname}/bitcointool "$pkgdir/usr/bin"
}

