# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>

pkgname=uv-bin
_pkgname=${pkgname%-bin}
conflicts=('uv')
provides=('uv')
_pkgver=0.1.9
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

sha256sums_aarch64=('51e3791eff68824daf1360631aa2f11f98f3728d5d342cadef191f53e9321c61')
sha256sums_i686=('3fed572fce343c86737e3912f86dce47a26611b07c86b2ff3be0f4936861a1d3')
sha256sums_x86_64=('4c6305655fba53bd68dcecebc622e172c9de369543539428a5449b4c6ee53ec0')

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
