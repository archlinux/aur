# Maintainer: TankMissile <alecfeldman@disroot.org>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Mikeserv

pkgname=bcache-tools
pkgver=1.1
pkgrel=1
changelog=bcache-tools.changelog
pkgdesc="Userspace tools for bcache until bcache merges with either dm or md."
url="http://bcache.evilpiepirate.org/"
arch=("i686" "x86_64")
license=("GPL")
depends=("util-linux")
install="$pkgname.install"
source=("https://git.kernel.org/pub/scm/linux/kernel/git/colyli/$pkgname.git/snapshot/$pkgname-$pkgver.tar.gz"
        "initcpio-dracut-arch.patch")
sha256sums=("d1c92274ae03b414dd1a05277bf89dd2a8395496c692e3b143d9e6112d3421f8"
            "fea3ddfcef7aaac6cc6dd0c5497bc5f69f799d4f9f286e978ebd4b9326347f9c")

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir/initcpio-dracut-arch.patch"
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -d \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/lib/udev/rules.d" \
    "$pkgdir/usr/share/man/man8" \
    "$pkgdir/usr/lib/initcpio/install"

  make DESTDIR="$pkgdir" install
}
