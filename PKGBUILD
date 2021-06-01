# Maintainer: NeverBehave <aur@never.pet>
_commit="42e614edcffa4f9d4d796a08841207af9779d494"

pkgname=geocam-bin
pkgrel=1
pkgver=r5.42e614e
arch=('x86_64')
pkgdesc="Camera Assembly for the Atomic Pi Single-board computer from Digital Loggers"
url="https://github.com/digitalloggers/geocam-bin"
license=('unknown')
makedepends=('git')
optdepends=('geocam-v4l2: H.264-encoded stream support')
source=(
  "git+https://github.com/digitalloggers/geocam-bin#commit=$_commit"
  83-geocam.rules
)
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
md5sums=('SKIP'
         '99e8513f52742641dd89a45b473d5c93')

package() {
    install -dm755 "$pkgdir/usr/lib/$pkgname/"
    cd "$srcdir/geocam-bin"
    install -m644 sensor_ov2710_mayfield_le.bin gc6500_ddrboot_fw.img config.json "$pkgdir/usr/lib/$pkgname"
    install -m755 mxcam "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    install -m644 "$srcdir/83-geocam.rules" "$pkgdir/usr/lib/udev/rules.d/83-geocam.rules"
}
