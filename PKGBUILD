# Maintainer: Stefan Auditor <stefan@auditor.email>

_pkgname=php-language-server
pkgname="${_pkgname}-git"
pkgver=v5.4.6.r27.ga66d994
pkgrel=1
pkgdesc="PHP language server implementation"
arch=('x86_64')
url="https://github.com/zobo/php-language-server"
license=('ISC')
depends=('php')
makedepends=('composer')
source=(
    "$_pkgname::git+https://github.com/zobo/${_pkgname}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    composer install
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/php/$_pkgname"
    install -Dm755 "../../${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
    cp -dr --no-preserve=ownership . "${pkgdir}/usr/share/php/${_pkgname}"
}
