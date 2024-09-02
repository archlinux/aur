# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=monitorctl-bin
pkgver=0.1.2
_pkgver=monitorctl-v0.1.2
pkgrel=3
pkgdesc="A way to control monitor brightness through the command line (binary release)"
url="https://github.com/5iddy/monitorctl"
license=('MIT')
arch=('x86_64')
depends=('ddcutil' 'gcc-libs' 'systemd-libs')
conflicts=("monitorctl")
provides=("monitorctl")
source=("monitorctl-$pkgver::$url/releases/download/monitorctl-v$pkgver/monitorctl"
        "$url/raw/v$pkgver/README.md"
        "$url/raw/3c65d23b23d75f7228a083f6ea040b3d02be7a7a/LICENSE")
sha256sums=('7e577700d305b385baec20b6fda148ab3f263475041a09ce574cdfe920b739d8'
            '238f884828183be6b0b5d42188947d4b3aa2abb09e72e0b76ee26e9a76682277'
            '3427471c4b875f2374c3bcc25e88cd2732bb61049212b3c9a18afabdf4450bc3')

prepare() {
  # "Create a modprobe config"
  echo "i2c-dev" > i2c-dev.conf
}

package() {
  install -Dm644 i2c-dev.conf -t "$pkgdir/etc/modules-load.d"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/monitorctl"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/monitorctl"
  install -Dm755 monitorctl-$pkgver "$pkgdir/usr/bin/monitorctl"
}
