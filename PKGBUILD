# Maintainer: Bitals <me at bitals dot xyz>

pkgname='zsa-kontroll'
_repo="$(cut -d "-" -f 2 <<< ${pkgname})"
pkgdesc="Control your ZSA keyboard from the command line and scripts"
pkgver=1.0.3
pkgrel=1
url='https://github.com/zsa/${pkgname}'
source=("git+https://github.com/zsa/${_repo}#tag=${pkgver}") #https://github.com/zsa/${_repo}/releases/download/1.0.3/${_repo}-1.0.3-linux-x64.tar.gz
makedepends=(rust protobuf)
depends=(glibc gcc-libs)
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
