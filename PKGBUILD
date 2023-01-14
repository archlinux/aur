# Maintainer: Jonas Jelten <jj ätt sft.lol>

pkgbase=xautocfg
pkgname=(xautocfg)
pkgver=1.1
pkgrel=1
arch=('x86_64')
url='https://github.com/SFTtech/xautocfg'
license=('GPL3')
pkgdesc='automatic keyboard repeat rate configuration'
depends=(
  libx11
  libxi
  xorgproto
)
makedepends=()
options=()
source=($pkgname-$pkgver.tar.gz::https://github.com/SFTtech/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('c967e747601608829ab09c46063fbd75d959026edbda6e3290b923c81389607fb5500bd453f28044a6f57a8b87ebb36b2b50a853387a9b258e87cd4f901a3fc3')

build() {
  cd ${pkgname}-${pkgver}
  make -j$(nproc)
}

package() {
  cd ${pkgname}-${pkgver}

  mkdir -p "${pkgdir}"/usr/{bin/,share/man/man1/,/lib/systemd/user/}
  cp xautocfg "${pkgdir}/usr/bin/"
  cp xautocfg.1 "${pkgdir}/usr/share/man/man1/"
  cp etc/xautocfg.service "${pkgdir}/usr/lib/systemd/user/"
}
