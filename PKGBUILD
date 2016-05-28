# Maintainer: SplitFire (split7fire at yandex.ru)

pkgname=freelan-git
pkgver=r3730.43062cd
pkgrel=1
pkgdesc="A peer-to-peer, secure, easy-to-setup, multi-platform, open-source, highly-configurable VPN software."
arch=('any')
url="https://github.com/freelan-developers/freelan"
license=('GPL')
depends=('boost' 'curl' 'openssl' 'scons' 'python')
makedepends=('git')
source=($pkgname::git+'https://github.com/freelan-developers/freelan.git')
# Because the sources are not static, skip Git checksum:
sha512sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
    scons install prefix=$pkgdir/usr/bin
}
