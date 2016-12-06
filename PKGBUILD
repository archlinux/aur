# Maintainer: SplitFire (split7fire at yandex.ru)

pkgname=freelan-git
pkgver=r3731.d248bb5
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
    scons install prefix=$pkgdir/ bin_prefix=$pkgdir/usr
}
