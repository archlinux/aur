pkgname=v6asm-bin
pkgver=2026.07.22
pkgrel=1
pkgdesc="CLI Intel 8080/Z80 assembler and FDD image tool for Vector-06c. Binary release"
arch=('x86_64')
url="https://github.com/parallelno/v6asm"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("v6asm=${pkgver}" "v6fdd=${pkgver}")
conflicts=('v6asm' 'v6fdd')
options=('!strip' '!debug')
_archive="v6asm-${pkgver}-linux-x86_64"
source=("${_archive}.tar.gz::${url}/releases/download/v${pkgver}/${_archive}.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/parallelno/v6asm/v${pkgver}/LICENSE")
sha256sums=('39d798be48539c531b07bf3a573e58677b38c714bc313e4aea5cfd09b529f27d'
            '678a2b915391edae5152d35537723c846066be268c8b36a8502703379356cb44')

package() {
  cd "${_archive}"
  install -Dm755 -t "${pkgdir}/usr/bin/" v6asm v6fdd
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" docs/*.md
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
