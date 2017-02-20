# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor:  Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.7.8
pkgrel=1
_jnaver=4.3.0
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
        https://github.com/java-native-access/jna/archive/$_jnaver.tar.gz
        $pkgname-arch.sh $pkgname.svg $pkgname.desktop)

md5sums=('3828ca9ef0fd1b711d555ec0ac60222c'
         '2de8ba99fc91809935e6c2ab02f49a82'
         'd94b4245dd3b226872f05fd2bf75bd1c'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3')

optdepends=('libzen: Support for additional subtitle search engines (Sublight)'
	    'libmediainfo: Episode naming / Sublight usage'
	    'java-p7zip-binding: Extract archives'
	    'gvfs: gvfs backends')

#noextract=($(for i in ${source[@]}; do basename $i; done))

build() {
  /bin/true
}

prepare() {
  cd jna-$_jnaver/lib/native/
  unzip linux-$_intarch.jar 2>&1 >/dev/null
}

package() {
  install -Dm644 FileBot.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 jna-$_jnaver/lib/native/libjnidispatch.so "$pkgdir/usr/share/java/$pkgname/libjnidispatch.so"
  install -Dm755 $pkgname-arch.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
