# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>

pkgname=uv-bin
_pkgname=${pkgname%-bin}
conflicts=('uv')
provides=('uv')
_pkgver=0.1.16
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

sha256sums_aarch64=('ca18e5b1c9d776130d67e6b7a4f22d14e6abd65c84106fb8b3b2c097bff18f90')
sha256sums_i686=('ea109c8a25ff78e99318af5c0e8ef9348ff64af2ee718345a4a1e87d0e1e4820')
sha256sums_x86_64=('84b15dbd298969ecf2bffb22a3e1003df085579d53d39a6bb87d5813a14e10f2')

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
