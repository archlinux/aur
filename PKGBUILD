# Maintainer: xsmile <>

pkgname=ryzen-ppd
pkgver=0.1
pkgrel=1
pkgdesc='Power profile daemon for AMD Ryzen CPUs'
arch=(x86_64)
url=https://aur.archlinux.org/packages/ryzen-ppd
license=(GPL3)
depends=(ryzenadj)
optdepends=('acpid: for switching profiles on AC and battery modes')
backup=(etc/ryzen-ppd)
install=ryzen-ppd.install
source=(ryzen-ppd.conf
        ryzen-ppd.event
        ryzen-ppd.handler
        ryzen-ppd.service
        ryzen-ppd.sh
        defaults.conf)
sha256sums=('8e9e91938bd0dbeb9cacc92a564b46181c0b6f1d58d0e8bfca77f3f66238e621'
            'c7e437568b255b819663b060b1f850dc3adb87b2f422da27b3ba3996d374234b'
            '8da2a034c3304815638dad20fc247cd226a9eca35ee83ddaeae3a3ddee921cfb'
            '0fa8e1dd822d0910055d675f5f7b93ddbba0f1303cb3eb7ce899c6799a1c62eb'
            '8c6ca20ab6dd18429e12d9ff04026cd120a09f627a0057319c14ea9a9d6a483d'
            'e25b2a02f7032e8580798007fab867eca557e2e937cfd9f445c52f7bd1af06df')

package() {
  # executable
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  # configuration files
  install -Dm644 "$srcdir"/defaults.conf "$pkgdir"/usr/share/$pkgname/defaults
  install -Dm644 "$srcdir"/$pkgname.conf  "$pkgdir"/etc/$pkgname
  # systemd service
  install -Dm644 "$srcdir"/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system
  # acpid configuration
  install -Dm644 "$srcdir"/$pkgname.event   "$pkgdir"/etc/acpi/events/$pkgname
  install -Dm755 "$srcdir"/$pkgname.handler "$pkgdir"/etc/acpi/$pkgname.sh
}
