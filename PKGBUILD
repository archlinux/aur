# Maintainer: kobe-koto <k@koto.cc>

pkgname=ddcci-probe-git
pkgver=r4.8d4cd53
pkgrel=1
pkgdesc="detect monitor connection status and attach/detach ddcci automatically"
url="https://github.com/kobe-koto/ddcci-probe"
arch=('any')
license=('MIT')
depends=('ddcci-driver-linux-dkms-git')
makedepends=('git')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 $srcdir/$pkgname/ddcci_probe.sh $pkgdir/usr/bin/ddcci_probe.sh
    install -Dm755 $srcdir/$pkgname/99-ddcci-hotplug.rules $pkgdir/usr/lib/udev/rules.d/99-ddcci-hotplug.rules
}
