# Maintainer: Diego Alves <dfqalves@gmail.com>
_name=jvpn
pkgname=$_name-git
pkgver=0.7.0.r18.g39933ba
pkgrel=1
pkgdesc="Script to connect to the Juniper firewall with enabled HostChecker"
arch=("x86_64")
url="https://github.com/samm-git/jvpn"
license=('GPL')
depends=("perl-term-readkey" "perl-lwp-protocol-https" "jdk" "unzip" "lib32-zlib" "net-tools")
makedepends=("git")
provides=("$_name")
conflicts=("$_name")
source=("git+https://github.com/samm-git/$_name.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_name"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    mkdir -p "$pkgdir/opt/$_name"
    cp -r $srcdir/$_name/* $pkgdir/opt/$_name

    mkdir -p "$pkgdir/usr/bin"
    echo "#!/bin/bash" >> "$pkgdir/usr/bin/jvpn"
    echo "cd /opt/jvpn" >> "$pkgdir/usr/bin/jvpn"
    echo "exec sudo ./jvpn.pl" >> "$pkgdir/usr/bin/jvpn"
    chmod +x "$pkgdir/usr/bin/jvpn"
}