# Maintainer: Chris Tam <LChris314 at gmail dot com>
pkgname=tmsu-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="A tool for tagging your files and accessing them through a virtual filesystem. (Pre-compiled)"
arch=('x86_64')
url="https://tmsu.org"
license=('GPL3')
depends=(
  'fuse'
  'sqlite>=3'
)
provides=('tmsu')
conflicts=('tmsu')

source=("https://github.com/oniony/TMSU/releases/download/v${pkgver}/tmsu-x86_64-${pkgver}.tgz")

sha256sums=('8e648e1674b00b288a7307d962806281f97f7169a398f84b3616887c5da3e722')

package() {
  for _file in "${srcdir}/${pkgname/-bin/}-x86_64-${pkgver}/bin/"*; do
    install -Dm755 "${_file}" "${pkgdir}/usr/bin/$(basename ${_file})"
  done

  install -Dm644 "${srcdir}/${pkgname/-bin/}-x86_64-${pkgver}/man/tmsu.1.gz" "${pkgdir}/usr/share/man/man1/tmsu.1.gz"

  install -Dm644 "${srcdir}/${pkgname/-bin/}-x86_64-${pkgver}/COPYING.md" "${pkgdir}/usr/share/licenses/${pkgname/-bin/}-x86_64-${pkgver}/COPYING.md"

  install -Dm644 "${srcdir}/${pkgname/-bin/}-x86_64-${pkgver}/misc/zsh/_tmsu" "${pkgdir}/usr/share/zsh/site-functions/_tmsu"
}
