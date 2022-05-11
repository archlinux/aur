# Maintainer: realasking <realasking@outlook.com>

pkgname=brother-dcpt420w
pkgver=3.5.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-T420W wifi multifuncional printer, modified from Chiwan Park's DCP-T520W pack."
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
install="brother-dcpt420w.install"
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'brscan4: making dcpt420w available to sane'
            'brscan-skey: scankey support if connected via usb')

if [[ "$CARCH" == "x86_64" ]] ; then
  depends=('a2ps' 'cups' 'lib32-glibc')
elif [[ "$CARCH" == "i686" ]] ; then
  depends=('a2ps' 'cups')
fi

source=(
  "https://download.brother.com/welcome/dlf105168/dcpt420wpdrv-3.5.0-1.i386.deb" \
  "fix_lp.patch"
)
sha256sums=(
  '3ede819a65aec379ec7676f7ac0cacabd70879fbaaf2c7978eeae406c0e1c1f2' \
  'ddb53ba14356b1fb98f19e3b32f124e878f06819a2cb6cb40a719d2250fababf'
)

build() {
    cd "$srcdir"
    tar -xf data.tar.gz -C .
    tar -xf control.tar.gz -C .
  patch -Np0 < fix_lp.patch
}

post_install() {
  /opt/brother/Printers/dcpt420w/cupswrapper/cupswrapperdcpt420w
}

package() {
  install -d $pkgdir/usr/bin
  install -d $pkgdir/var/spool/lpd
  cp -R $srcdir/opt $pkgdir/opt
}
