# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=coreboot-battery-threshold-git
_gitname=coreboot-battery-threshold
pkgver=0
pkgrel=1
pkgdesc='Simple script to set battery thresholds on coreboot devices.'
url='https://github.com/Baitinq/coreboot-battery-threshold.git'
arch=('any')
license=('GPL')
depends=('ectool')
makedepends=('git')
provides=('coreboot-battery-threshold')

source=("git://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  # Install the program.
  mkdir -p "$pkgdir/usr/share/$_gitname"
  install -Dm755 coreboot-battery-threshold "${pkgdir}/usr/bin/$_gitname"
  chmod +x "$pkgdir/usr/bin/$_gitname"
  install -Dm 644 $_gitname.service \
    "$pkgdir/etc/systemd/system/$_gitname.service"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$_gitname"
  chmod -R 777 "$pkgdir/usr/share/$_gitname"

}
