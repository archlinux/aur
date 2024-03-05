# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>

pkgname=uv-bin
_pkgname=${pkgname%-bin}
conflicts=('uv')
provides=('uv')
_pkgver=0.1.15
pkgver=${_pkgver#v}
pkgrel=1
pkgdesc='An extremely fast Python package installer and resolver, written in Rust. Designed as a drop-in replacement for pip and pip-compile.'
arch=(aarch64 i686 x86_64)
url='https://github.com/astral-sh/uv'
license=('Apache-2.0 OR MIT')
depends=('zlib')
source=(https://raw.githubusercontent.com/astral-sh/uv/$pkgver/README.md)
sha256sums=(SKIP)

_release_url='https://api.github.com/repos/astral-sh/uv/releases/latest'

source_aarch64=($pkgname-aarch64-$pkgver.tar.gz::https://github.com/astral-sh/uv/releases/download/$pkgver/uv-aarch64-unknown-linux-gnu.tar.gz)
source_i686=($pkgname-i686-$pkgver.tar.gz::https://github.com/astral-sh/uv/releases/download/$pkgver/uv-i686-unknown-linux-gnu.tar.gz)
source_x86_64=($pkgname-x86_64-$pkgver.tar.gz::https://github.com/astral-sh/uv/releases/download/$pkgver/uv-x86_64-unknown-linux-gnu.tar.gz)

sha256sums_aarch64=('33c5c5340b0c29381b0dcfc0458194800a74866301fd6f64efb1e77e4491beba')
sha256sums_i686=('56ceeb2d72f0ae1fa2852b4951bb0c64c5502472a867532ca157c89e93ade4c2')
sha256sums_x86_64=('00a37907aa7985e88584ab4765905b720fa8b9088d1bcae7611c10f398299c5d')

check() {
  cd "${_pkgname}-${CARCH}-unknown-linux-gnu"
  ./uv --version
  ./uv venv test
  ./test/bin/python3 --version
}

package() {
  install -Dm644 ./README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
  install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu/uv" "${pkgdir}/usr/bin/uv"
}
