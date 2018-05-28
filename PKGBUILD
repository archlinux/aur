pkgname=shellcheck-git-static
pkgver=0.4.7
pkgrel=1
pkgdesc="shellcheck-static, but using the latest-commit builds maintained by the author"
license=("AGPL3")
arch=("i686" "x86_64")
depends=('gmp')
conflicts=("shellcheck")
provides=("shellcheck=${pkgver}")

source=(
    "https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/shellcheck-latest"
  ./shellcheck -V | sed -nE 's/^version: (.*)$/\1/p'
}

package() {
    cd "${srcdir}/shellcheck-latest"
    install -Dt "${pkgdir}/usr/bin" "shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "LICENSE.txt" "README.txt"
}
