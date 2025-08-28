# Contributor: Rorschach <r0schach@lavabit.com>
# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=ipscan-bin
_pkgintname=ipscan
pkgver=3.9.2
_pkgintver=3.9.2
pkgrel=1
pkgdesc='Angry IP Scanner (or simply ipscan) is an open-source and cross-platform network scanner designed to be fast and simple to use. It scans IP addresses and ports as well as has many other features.'
arch=('i686' 'x86_64')
license=('GPL2')
url="https://angryip.org/"
depends=('java-runtime>=17')
provides=(ipscan)
conflicts=(ipscan)

[[ $CARCH == "i686" ]] && _intarch=linux
[[ $CARCH == "x86_64" ]] && _intarch=linux64

source=(ipscan.png ipscan ipscan.desktop)
source_i686+=(https://github.com/angryip/ipscan/releases/download/$_pkgintver/ipscan-$_intarch-$_pkgintver.jar)
source_x86_64+=(https://github.com/angryip/ipscan/releases/download/$_pkgintver/ipscan-$_intarch-$_pkgintver.jar)

md5sums=('59de9b8055fe037c77bf8339eee31b85'
         '5b1c941c32a444803677a2061aa55a70'
         'b9af5f626689374ff6018b150aada64d')
md5sums_i686=('18c72d123ce0fcafc5c23efde82f1889')
md5sums_x86_64=('18c72d123ce0fcafc5c23efde82f1889')

noextract=($(for i in ${source[@]}; do basename $i; done) ipscan-$_intarch-$_pkgintver.jar)

package() {
  cd "$srcdir"
  install -Dm755 $_pkgintname $pkgdir/usr/bin/$_pkgintname
  install -Dm644 $_pkgintname.png $pkgdir/usr/share/pixmaps/$_pkgintname.png
  install -Dm644 $_pkgintname.desktop $pkgdir/usr/share/applications/$_pkgintname.desktop
  install -Dm644 $_pkgintname-$_intarch-$_pkgintver.jar $pkgdir/usr/share/java/$_pkgintname/$_pkgintname-$_intarch-$_pkgintver.jar
}
