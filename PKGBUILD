# Maintainer: Cezary Drożak <czarek at drozak dot net>

pkgname=b00merang-haiku-git
pkgver=r31.9fa6424
pkgrel=2
pkgdesc='GTK theme based on the appearance of the open source operating system Haiku, the successor to BeOS.'
arch=('any')
url='https://github.com/B00merang-Project/Haiku'
license=('GPL3')
depends=('gtk-engine-murrine')
optdepends=('lib32-gtk-engine-murrine: Required for 32-bit apps in 64-bit environments')
makedepends=('git')
source=("${pkgname}::git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"

  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$pkgname"
    local dest="$pkgdir"/usr/share/themes/'Haiku'

    install -d "$dest"
    cp -r * "$dest"
}

# vim: ts=4 sw=4 ft=sh
