# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>
pkgname=brother-dcpj1200w
pkgver=3.5.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-J1200W"
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcpj1200w_eu_as"
license=('custom:brother')
depends=('cups')
install="$pkgname.install"
arch=('i686' 'x86_64')
source=(
    "fix_lp.patch" \
    "https://download.brother.com/welcome/dlf105286/dcpj1200wpdrv-$pkgver-1.i386.rpm"
)
sha256sums=('a20b4dcd385b1a8bc1a46e5e648020cb201a9c9b29903dd5b62c371f116c3ca6'
            'b39ab6013520ed5d909992c8b6d9263c49126b34a5285e7bf94d40160c8a7cbd')

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

package()
{
    install -d $pkgdir/usr/bin
    install -Dm755 "$srcdir"/opt/brother/Printers/dcpj1200w/lpd/x86_64/brprintconf_dcpj1200w "$pkgdir"/usr/bin/
    cp -R $srcdir/opt $pkgdir/opt
    mv "$srcdir"/opt/brother/Printers/dcpj1200w/lpd/x86_64/* "$srcdir"/opt/brother/Printers/dcpj1200w/lpd
    rmdir "$srcdir"/opt/brother/Printers/dcpj1200w/lpd/x86_64
}
