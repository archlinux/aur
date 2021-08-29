# Maintainer: Chiwan Park <chiwanpark@hotmail.com>

pkgname=brother-dcpt520w
pkgver=3.5.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-T520W wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
install="brother-dcpt520w.install"
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'brscan4: making dcpt520w available to sane'
            'brscan-skey: scankey support if connected via usb')

if [[ "$CARCH" == "x86_64" ]] ; then
  depends=('a2ps' 'cups' 'lib32-glibc')
elif [[ "$CARCH" == "i686" ]] ; then
  depends=('a2ps' 'cups')
fi

source=(
  "http://download.brother.com/welcome/dlf105173/dcpt520wpdrv-$pkgver-$pkgrel.i386.rpm" \
  "fix_lp.patch"
)
sha256sums=(
  'f096e7737b985209404d25ae25b862463c07fff67f31f807b68a188209c7b734' \
  'db4f8c1f9ad69aa0dbb53755e076ef60256f871f64c4d6179cd9e4d21c4625c1'
)

build() {
  cd "$srcdir"
  patch -Np0 < fix_lp.patch
}

post_install() {
  /opt/brother/Printers/dcpt520w/cupswrapper/cupswrapperdcpt520w
}

package() {
  install -d $pkgdir/usr/bin
  install -d $pkgdir/var/spool/lpd
  cp -R $srcdir/opt $pkgdir/opt
}
