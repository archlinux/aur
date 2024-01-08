# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: James An <james@jamesan.ca>

pkgname=minica-git
_pkgname=${pkgname%-git}
pkgver=v1.0.2.r4.g96a5c93
pkgrel=1
pkgdesc='A small, simple CA intended for use in situations where the CA operator also operates each host where a certificate will be used.'
arch=('i686' 'x86_64')
url="https://github.com/jsha/$_pkgname"
license=('unknown')
makedepends=('git' 'go')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/jsha/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "$_pkgname"

  go build
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
