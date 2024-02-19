# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>

pkgname=uv-bin
_pkgname=${pkgname%-bin}
conflicts=('uv')
provides=('uv')
_pkgver=0.1.5
pkgver=${_pkgver#v}
pkgrel=4
pkgdesc='An extremely fast Python package installer and resolver, written in Rust. Designed as a drop-in replacement for pip and pip-compile.'
arch=(aarch64 i686 x86_64)
url='https://github.com/astral-sh/uv'
license=('MIT')

_release_url='https://api.github.com/repos/astral-sh/uv/releases/latest'

source_aarch64=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-aarch64-unknown-linux-gnu.tar.gz)
source_i686=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-i686-unknown-linux-gnu.tar.gz)
source_x86_64=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-x86_64-unknown-linux-gnu.tar.gz)

sha256sums_aarch64=('23d4ac8e358ef51e436e0dc66f120cf5acb86c1cede69d8ee3bed0864a44efdf')
sha256sums_i686=('8a9b3fa8c50ab85767db7c633589ce8aae6440ce615e3984c96aa2885b97d949')
sha256sums_x86_64=('06e1530ca6dd161d7052a26cd08716276d8d6aee90d6e164cf4e05d4f5694312')

check() {
  cd "${_pkgname}-${CARCH}-unknown-linux-gnu"
  ./uv --version
  ./uv venv test
  ./test/bin/python3 --version
}

package() {
  cd "${_pkgname}-${CARCH}-unknown-linux-gnu"
  install -Dm755 uv "${pkgdir}/usr/bin/uv"
}
