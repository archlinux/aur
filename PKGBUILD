pkgname=brother-dcp165c
pkgver=1.1.2
pkgrel=1
pkgdesc="Driver for Brother DCP-165C printer"
url="https://support.brother.com/g/b/producttop.aspx?c=de&lang=de&prod=dcp165c_all"
license=('custom:brother')
depends=('a2ps' 'cups' 'lib32-gcc-libs' 'lib32-glibc')
optdepends=('brscan3: scanner support.')
install="brother-dcp165c.install"
arch=('i686' 'x86_64')

md5sums=('51b9c8ea31dc37540cb8264bb05ca3f7'
         '22a0932c6547a682af4a16fb86100614'
         '0bf765de513b8d1e37567ecf2c04897e')

source=(
    "fix_lp.patch" \
    "https://download.brother.com/welcome/dlf005378/dcp165clpr-1.1.2-2.i386.rpm" \
    "https://download.brother.com/welcome/dlf005380/dcp165ccupswrapper-1.1.2-2.i386.rpm"
)

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

post_install() {
    /usr/local/Brother/Printer/dcp165c/cupswrapper/cupswrapperdcp165c
}

package() {
    install -d $pkgdir/usr/bin
    install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcp165c "$pkgdir"/usr/bin/
    cp -R $srcdir/usr/. $pkgdir/usr
}
