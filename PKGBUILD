pkgname=sheldon-git
pkgver=r7.f67929b
pkgrel=1
pkgdesc="a very useful website"
arch=('any')
url="https://github.com/iamanuclearwarhead/sheldon"
license=('GPL-3.0-or-later')
depends=('xdg-utils')
makedepends=('git')
conflicts=('sheldon')
source=("git+https://github.com/iamanuclearwarhead/sheldon.git")
sha256sums=('SKIP')

pkgver() {
  cd sheldon
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd sheldon
  install -Dm644 website.html "$pkgdir/usr/share/sheldon/website.html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec xdg-open /usr/share/sheldon/website.html\n' > "$pkgdir/usr/bin/sheldon"
  chmod 755 "$pkgdir/usr/bin/sheldon"
}
