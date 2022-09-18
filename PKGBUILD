# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=waydroid
pkgver=1.3.2
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system"
arch=('any')
url='https://github.com/waydroid'
license=('GPL')
depends=('lxc' 'python' 'python-gbinder' 'python-gobject' 'nftables' 'dnsmasq')
makedepends=('git')
optdepends=('waydroid-image: Android image for use with waydroid'
            'python-pyclip: share clipboard with container')
_commit="68ed713ca10e9570ec0dbea72a3ba04a4ca54b4e" # tags/1.3.2
source=("waydroid::git+https://github.com/waydroid/waydroid.git#commit=$_commit"
        gbinder.conf)

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
  make -C waydroid install DESTDIR="$pkgdir" USE_NFTABLES=1
}

sha256sums=('SKIP'
            '87a21d401281735ea026d715ea79b36e01f9af084198de2761b32d5b58a343dd')
