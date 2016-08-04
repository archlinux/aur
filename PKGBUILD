# Contributor: Rorschach <r0schach@lavabit.com>
# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=ipscan
pkgver=3.4.2
_pkgintver=3.4.2
pkgrel=1
pkgdesc='Angry IP Scanner (or simply ipscan) is an open-source and cross-platform network scanner designed to be fast and simple to use. It scans IP addresses and ports as well as has many other features.'
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.angryziber.com"
depends=('java-runtime>=6')

[[ $CARCH == "i686" ]] && _intarch=linux
[[ $CARCH == "x86_64" ]] && _intarch=linux64

source=(ipscan.png \
	ipscan \
	ipscan.desktop )
source_i686+=(http://downloads.sourceforge.net/project/ipscan/ipscan3-binary/$_pkgintver/ipscan-linux-$_pkgintver.jar)
source_x86_64+=(http://downloads.sourceforge.net/project/ipscan/ipscan3-binary/$_pkgintver/ipscan-linux64-$_pkgintver.jar)

md5sums=('59de9b8055fe037c77bf8339eee31b85'
         '5b1c941c32a444803677a2061aa55a70'
         '6a8f7a0fb70cf2c801ff5422870609f9')
md5sums_i686=('37aa7d182817d2cccaddb843b0e946e1')
md5sums_x86_64=('be202c9d60671c6069a8a93377b27692')

noextract=($(for i in ${source[@]}; do basename $i; done) ipscan-linux-$_pkgintver.jar ipscan-linux64-$_pkgintver.jar)

build() {
  /bin/true
}

package() {
  cd "$srcdir"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname || return 1
  install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png || return 1
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop || return 1
  install -Dm644 $pkgname-$_intarch-$_pkgintver.jar $pkgdir/usr/share/java/$pkgname/$pkgname-$_intarch-$_pkgintver.jar || return 1
}

