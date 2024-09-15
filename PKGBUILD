# Maintainer: Jonas Jelten <jj ätt sft.lol>

pkgbase=xautocfg
pkgname=(xautocfg)
pkgver=1.2
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
b2sums=('52c70ee05542e60fa2480959a016e6c7dc52a13954cde8ba0153323558bf83836d15dc0da8f4b97259590fc790c756a1dcf39e81cde18be9ff6464437c4b499d')

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
