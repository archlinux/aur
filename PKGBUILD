# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>

pkgname=uv-bin
_pkgname=${pkgname%-bin}
conflicts=('uv')
provides=('uv')
_pkgver=0.1.13
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

sha256sums_aarch64=('16429c1a00b0a1fb653ae8a104d5af121bc765f047a7b750f356515c50c226c7')
sha256sums_i686=('3a74bace4da3dbdc3f36e7720d7f6bc56098716e7c3e949664b301136fdf3dee')
sha256sums_x86_64=('2bfc6a542a3df6af6f56ccd8ec9f1b0596fff62b11650b0bdb830f10ee4e2d64')

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
