# Maintainer: Kevin McCormack <HarlemSquirrel@gmail.com>

pkgname=xmr-stak-opencl-amd
pkgver=2.10.8
pkgrel=1
pkgdesc='Unified All-in-one Monero miner (AMD)'
arch=('x86_64')
url='https://github.com/fireice-uk/xmr-stak'
license=('GPL3')
makedepends=('cmake' 'git' 'opencl-headers')
depends=('hwloc' 'libmicrohttpd' 'opencl-amd' 'openssl')
source=("git+https://github.com/fireice-uk/xmr-stak.git#tag=${pkgver}"
        'no-donate.patch')
sha256sums=('SKIP'
            '30ef1099d196a4ead4338c89ff8608258fe4e1a6f5eed99f3c96c41d9e77fdcd')

prepare() {
  cd "$srcdir/xmr-stak"
  patch -p1 -i ../no-donate.patch
}

build() {
  cd "$srcdir/xmr-stak"
  cmake . -DCUDA_ENABLE=OFF
  make
}

package() {
  install -D -m755 "$srcdir/xmr-stak/bin/xmr-stak" -t "$pkgdir/usr/bin/"
  install -D -m644 "$srcdir/xmr-stak/bin/libxmrstak_opencl_backend.so" -t "$pkgdir/usr/lib"
}

## Generate integrity checks for source files
# makepkg --geninteg

## Update .SRCINFO
# makepkg --printsrcinfo | tee .SRCINFO
