# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
# Contributor:
_pkgname=tikz2pdf
pkgname=$_pkgname-git
pkgver=12+c58f831
pkgrel=1
pkgdesc="Script to help convert TikZ code to PDF"
arch=('x86_64')
url="https://github.com/ablondin/$_pkgname"
license=('BSD-3')
depends=('python')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed -r 's/^[r|v]//;s/-/+/g' ||
    printf '%s+%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
  )
}

package() {
  cd $_pkgname

  # Install the script
  install -Dm755 "tikz2pdf" "${pkgdir}/usr/bin/tikz2pdf"

  # Install the license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
