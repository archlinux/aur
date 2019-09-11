# Maintainer: Dudemanguy <random342@airmail.cc>
pkgname=dhcpcd-s6
pkgver=20190802
pkgrel=1
pkgdesc="s6 service scripts for dhcpcd"
arch=('any')
url="https://github.com/artix-linux"
groups=('s6-system')
depends=('dhcpcd' 's6-rc')
install=dhcpcd.install
source=('dhcpcd.conf' 'dhcpcd.dependencies' 'dhcpcd.run' 'dhcpcd.type')
sha256sums=('d75e413073215f062a56b47d4ec0366e2ae6b5d480fae21fada25d3e33269125'
            '3809f3ba1f3db4bd0eafffd50b0349387b9972672bb3c6e3a152e90952431d12'
            '0638d085d6703d51a29c26ca1483a1038e108f87dd78d32d2fff95cf9fc4fe2f'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in run conf type; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
    if test -f "$srcdir/$1.conf"; then
        install -Dm644 "$srcdir/$1.conf" "$pkgdir/etc/s6/sv/$1/conf"
    fi
}

package() {
    _inst_sv 'dhcpcd'
}
