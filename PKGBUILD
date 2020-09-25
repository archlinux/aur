# Maintainer: NeverBehave <aur@never.pet>
_commit="7416d9e26003fea1fdab5b2b25c2a714abf67575"

pkgname=geocam-bin
pkgrel=1
pkgver=r4.7416d9e
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
         '9e0416ca838630153f18dfa349d12bfe')

package() {
    install -dm755 "$pkgdir/usr/lib/$pkgname/"
    cd "$srcdir/geocam-bin"
    install -m644 sensor_ov2710_mayfield_le.bin gc6500_ddrboot_fw.img config.json "$pkgdir/usr/lib/$pkgname"
    install -m755 mxcam "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/lib/udev.d/rules"
    install -m644 "$srcdir/83-geocam.rules" "$pkgdir/usr/lib/udev.d/rules/83-geocam.rules"
}
