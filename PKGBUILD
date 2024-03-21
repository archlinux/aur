pkgname=shellcheck-git-static
pkgver=v0.10.0.r2.g50db9a2
pkgrel=1
pkgdesc="shellcheck-static, but using the latest-commit builds maintained by the author"
license=("AGPL3")
arch=("i686" "x86_64")
depends=('gmp')
conflicts=("shellcheck")
provides=("shellcheck=${pkgver}")

source=(
    "https://github.com/koalaman/shellcheck/releases/download/latest/shellcheck-latest.linux.x86_64.tar.xz"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/shellcheck-latest"
  ./shellcheck -V \
    | sed -n '/^version:/{s/^version: //;s/\([^-]*-g\)/r\1/;s#[-:/ ]#.#g;p}'
}

package() {
    cd "${srcdir}/shellcheck-latest"
    install -Dt "${pkgdir}/usr/bin" "shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "LICENSE.txt" "README.txt"
}
