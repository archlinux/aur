# Maintainer: Bitals <me at bitals dot xyz>

pkgname='zsa-kontroll'
_repo="$(cut -d "-" -f 2 <<< ${pkgname})"
pkgdesc="Control your ZSA keyboard from the command line and scripts"
pkgver=1.0.4
pkgrel=2
url="https://github.com/zsa/${pkgname}"
source=("git+https://github.com/zsa/${_repo}#tag=${pkgver}")
makedepends=('rust' 'protobuf')
depends=('glibc' 'gcc-libs' 'zsa-keymapp-bin')
arch=('x86_64')
license=('MIT')
sha512sums=('SKIP')

build() {
  cd "${srcdir}"/${_repo}
  cargo build --release
}

package() {
  mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m 755 "${srcdir}/${_repo}/target/release/${_repo}" "${pkgdir}/usr/bin/"
  install -m 644 "${srcdir}/${_repo}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
