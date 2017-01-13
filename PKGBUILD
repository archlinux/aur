# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor:  Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.7.7
pkgrel=4
pkgdesc="The ultimate tool to rename TV/anime shows, download subtitles, and validate checksums."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://filebot.sourceforge.net/"
license=('GPL')
install=$pkgname.install
depends=('java-runtime>=8' 'fontconfig' 'chromaprint')
makedepends=('unzip')

[[ $CARCH == "i686" ]]   && _intarch=x86
[[ $CARCH == "x86_64" ]] && _intarch=x86-64
[[ $CARCH == "arm" ]]    && _intarch=arm
[[ $CARCH == "armv6h" ]] && _intarch=arm
[[ $CARCH == "armv7h" ]] && _intarch=arm

source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/FileBot_$pkgver/FileBot_$pkgver-portable.tar.xz
        http://downloads.sourceforge.net/project/$pkgname/$pkgname/FileBot_4.7.5/FileBot_4.7.5-portable.tar.xz
        $pkgname-arch.sh $pkgname.svg $pkgname.desktop)

md5sums=('58d35910d5d164454c7840122a17dace'
         '8fb4f6d1cc4a136c46e1d8bc416c6df5'
         '3b51756c50a54447a5e6fb6c052e3453'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3')

optdepends=('libzen: Support for additional subtitle search engines (Sublight)'
	    'libmediainfo: Episode naming / Sublight usage'
	    'java-p7zip-binding: Extract archives'
	    'gvfs: gvfs backends')

noextract=($(for i in ${source[@]}; do basename $i; done))

build() {
  /bin/true
}

prepare() {
  mkdir $pkgver
  mkdir 4.7.5
  tar -xJf ./FileBot_$pkgver-portable.tar.xz -C $pkgver
  tar -xJf ./FileBot_4.7.5-portable.tar.xz -C 4.7.5
  cd 4.7.5
  unzip FileBot.jar 2>&1 >/dev/null
}

package() {
  cd "$srcdir"
  install -Dm644 $pkgver/FileBot.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 4.7.5/com/sun/jna/linux-$_intarch/libjnidispatch.so "$pkgdir/usr/share/java/$pkgname/libjnidispatch.so"
  install -Dm755 $pkgname-arch.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
