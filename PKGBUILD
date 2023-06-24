# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=monitorctl
pkgname=$_pkgname-bin
pkgdesc="A way to control monitor brightness through the command line (binary release)"
pkgver=0.1.2
_pkgver=monitorctl-v0.1.2
pkgrel=2
arch=('x86_64')
url="https://github.com/5iddy/monitorctl"
license=('MIT')
conflicts=($_pkgname)
provides=($_pkgname)
_url2=https://raw.githubusercontent.com/5iddy/$_pkgname/$_pkgver
source=("$url/releases/download/monitorctl-v$pkgver/monitorctl"
        #"$_url2/LICENSE"
        "$_url2/README.md")
sha256sums=('7e577700d305b385baec20b6fda148ab3f263475041a09ce574cdfe920b739d8'
            'SKIP')

prepare() {
  # "Create a modprobe config"
  echo "i2c-dev" > i2c-dev.conf
}

package() {
  install -Dm644 i2c-dev.conf -t "$pkgdir/etc/modules-load.d"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  #install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 monitorctl -t "$pkgdir/usr/share/bin"
}
