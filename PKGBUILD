# Maintainer: willemw <willemw12@gmail.com>
# Contributor: pancho horrillo <pancho at pancho dot name>

pkgname=ansible-aur-git
pkgver=0.11.1.r0.gfe05001
pkgrel=1
pkgdesc='Ansible module to manage packages from the AUR'
arch=(any)
url=https://github.com/kewlfft/ansible-aur
license=(GPL-3.0-or-later)
depends=(ansible-core)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 $pkgname/README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 $pkgname/plugins/modules/aur.py -t "$pkgdir/usr/share/ansible/plugins/modules"
}
