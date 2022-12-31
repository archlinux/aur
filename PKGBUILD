# shellcheck disable=SC2034,SC2148,SC2154,SC2164
# Maintainer: Alessandro Cerruti
# Contributor: Alessandro Cerruti

_pkgbase=i3bard
pkgname=i3bard-git
pkgver=r31.d2c6d4e
pkgrel=1
pkgdesc='async i3blocks clone that can synchronize multiple instances'
arch=('any')
url='https://gitlab.com/chrooti/i3bard'
license=('MIT')
depends=(python)
makedepends=(git)
source=('i3bard::git+https://gitlab.com/chrooti/i3bard.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgbase"

  install -Dm755 i3bard "$pkgdir"/usr/bin/i3bard
  install -Dm644 i3bard.service "$pkgdir"/usr/lib/systemd/user/i3bard.service
  install -Dm644 i3bard.socket "$pkgdir"/usr/lib/systemd/user/i3bard.socket
}
