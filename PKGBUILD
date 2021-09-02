pkgname=brother-dcp365cn
pkgver=1.1.3
pkgrel=1
pkgdesc="Driver for Brother DCP-365CN printer"
url="https://support.brother.com/g/b/producttop.aspx?c=de&lang=de&prod=dcp365cn_eu_as"
license=('custom:brother')
depends=('a2ps' 'cups' 'lib32-gcc-libs' 'lib32-glibc')
optdepends=('brscan3: scanner support.')
install="brother-dcp365cn.install"
arch=('i686' 'x86_64')

md5sums=('597168d50cc1a39618b71b5233c7e196'
         '951f04eaa29ce2a95c0b46582cf09411'
         '0c62592b0c185bc6c2610b5407aaafb2')

source=(
    "fix_lp.patch" \
    "https://download.brother.com/welcome/dlf005418/dcp365cnlpr-1.1.3-1.i386.rpm" \
    "https://download.brother.com/welcome/dlf005420/dcp365cncupswrapper-1.1.3-1.i386.rpm"
)

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

post_install() {
    /opt/brother/Printers/dcp365cn/cupswrapper/cupswrapperdcp365cn
}

package() {
    install -d $pkgdir/usr/bin
    install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcp365cn "$pkgdir"/usr/bin/
    cp -R $srcdir/opt $pkgdir/opt
}
