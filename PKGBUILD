# Maintainer: Ishaan Bhimwal <ishaanbhimwal@gmail.com>

pkgname=brother-dcpt220
pkgver=3.5.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-T220 multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
install="${pkgname}.install"
arch=('i686' 'x86_64')
if [[ "$CARCH" == "x86_64" ]] ; then
  depends=('a2ps' 'cups' 'lib32-glibc')
elif [[ "$CARCH" == "i686" ]] ; then
  depends=('a2ps' 'cups')
fi

source=(
        "fix_lp.patch" \
        "https://download.brother.com/welcome/dlf105163/dcpt220pdrv-$pkgver-$pkgrel.i386.rpm" \
        "https://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.3-1.gz"
)

sha256sums=(
  '45f8a8f3947f561c735c644e1c2fdfcd56ea87756b5f7e023e8f9b04c80588de' \
  '2244b72cb354f7be1140f5cd44ae54befaafb901f98ca100594f6b36e577c88a' \
  '83db05062c535d45e348fbf9a69ae3a319af3d8787a36abebb656c0e0c5b7e7d'
)

build() {
  cd "$srcdir"
  patch -Np0 < fix_lp.patch
}

post_install() {
  /opt/brother/Printers/dcpt220/cupswrapper/cupswrapperdcpt220
}

package() {
  install -d $pkgdir/usr/bin
  install -d $pkgdir/var/spool/lpd
  cp -R $srcdir/opt $pkgdir/opt
}
