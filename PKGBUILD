# Maintainer: Wayne Campbell <wcampbell1995 [at] gmail [dot] com>
pkgname=mint-cli-git
_pkgname=mint-cli
pkgver=v0.1.1.r0.gd02b7c7
pkgrel=1
pkgdesc="cli interface for Intuit Mint using python-mintapi"
arch=('any')
url="https://github.com/userWayneCampbell/mint-cli"
license=('GPL')
depends=('git' 'python' 'python-mintapi' 'chromedriver' 'google-chrome' 'python-dotenv' 'python-tabulate-git' 'python-colorama-git' 'scdoc')
source=("git+https://github.com/userWayneCampbell/mint-cli.git")
md5sums=('SKIP')

# Support without tags and with tags
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$srcdir/${_pkgname}"
    make && sudo make install
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/local/bin/${_pkgname}"
    install --backup=numbered -Dm744 ".env.example" "${pkgdir}/etc/mint-cli/.env"
    mkdir -p -m 744 "${pkgdir}/var/lib/mint-cli/data/"
}
