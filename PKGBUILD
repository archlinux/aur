# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>

pkgname=uv-bin
_pkgname=${pkgname%-bin}
conflicts=('uv')
provides=('uv')
_pkgver=0.1.6
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

source_aarch64=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-aarch64-unknown-linux-gnu.tar.gz)
source_i686=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-i686-unknown-linux-gnu.tar.gz)
source_x86_64=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-x86_64-unknown-linux-gnu.tar.gz)

sha256sums_aarch64=('de9f62f4fbad55c6b8918006e02c65e9cb871d017263f4f1ec3ebb7b6ca87247')
sha256sums_i686=('332a3a588e95ba99eddbe059d7cf330d98a5d11db4b7d24ef3e9472e046d944b')
sha256sums_x86_64=('7dc7a615ed6d613ad49d77c0e4a39361a97f43b842e8b14536a00db9671ce5ab')

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
