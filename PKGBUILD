pkgname=shellcheck-git-static
pkgver=0.4.6
pkgrel=1
pkgdesc="shellcheck-static, but using the latest-commit builds maintained by the author"
license=("AGPL3")
arch=("i686" "x86_64")
depends=('gmp')
conflicts=("shellcheck")
provides=("shellcheck=0.4.6")

source=(
    "https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz"

    # We need this just to compute the pkgver to use :D
    "git+https://github.com/koalaman/shellcheck.git#branch=master"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/shellcheck"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/shellcheck-latest"
    install -Dt "${pkgdir}/usr/bin" "shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "LICENSE.txt" "README.txt"
}
