# Maintainer: Brod8362

pkgname=linuxsync-git
_pkgname=linuxsync
pkgver=r26.8a85256
pkgrel=1
pkgdesc="sync android notifications to linux (client)"
arch=('x86_64')
url='https://github.com/brod8362/linuxsync-client'
license=('GPL')
depends=('dbus'
         'openssl'
         'glibc'
         'gcc-libs'
     'systemd-libs'
     'xz'
     'lz4'
     'libgcrypt'
     'libgpg-error')
makedepends=('rust'
         'git')
provides=('linuxsync')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/usr" install
}
