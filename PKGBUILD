# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Contributor: nullgemm <nullgemm@mailbox.org>

pkgname=ly-git-openrc
_pkgname=ly
pkgver=0.5.3.24f017e0
pkgrel=1
pkgdesc="TUI display manager (OpenRC version)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fairyglade/$_pkgname"
license=('custom:WTFPL')
makedepends=('git')
depends=('pam' 'xorg-xauth')
conflicts=('ly' 'ly-git' 'python-ly' 'python-ly-git')
backup=(etc/$pkgname/{config.ini,wsetup.sh,xsetup.sh})
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" installopenrc
  install -Dm644 license.md "$pkgdir/usr/share/licenses/$_pkgname/WTFPL"
}
