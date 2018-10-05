# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor:  Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot47
pkgver=4.7.9
pkgrel=3
_jnaver=4.3.0
pkgdesc="The ultimate tool to rename TV/anime shows, download subtitles, and validate checksums."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://filebot.sourceforge.net/"
license=('GPL')
install=$pkgname.install
depends=('java-runtime>=8' 'fontconfig' 'chromaprint')
makedepends=('unzip')
provides=('filebot')
conflicts=('filebot')

[[ $CARCH == "i686" ]]   && _intarch=x86
[[ $CARCH == "x86_64" ]] && _intarch=x86-64
[[ $CARCH == "arm" ]]    && _intarch=arm
[[ $CARCH == "armv6h" ]] && _intarch=arm
[[ $CARCH == "armv7h" ]] && _intarch=arm

source=(https://f002.backblazeb2.com/file/AUR-Store/$pkgname/FileBot_$pkgver-portable.tar.xz
        https://github.com/java-native-access/jna/archive/$_jnaver.tar.gz
        filebot-arch.sh filebot.svg filebot.desktop)

md5sums=('961dbdb7d6c62c133952df2f9f427d96'
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
  install -Dm644 FileBot.jar "$pkgdir/usr/share/java/filebot/filebot.jar"
  install -Dm644 jna-$_jnaver/lib/native/libjnidispatch.so "$pkgdir/usr/share/java/filebot/libjnidispatch.so"
  install -Dm755 filebot-arch.sh "$pkgdir/usr/bin/filebot"
  install -Dm644 filebot.svg "$pkgdir/usr/share/pixmaps/filebot.svg"
  install -Dm644 filebot.desktop "$pkgdir/usr/share/applications/filebot.desktop"
}
