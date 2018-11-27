# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.8.2
pkgrel=1
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
install=$pkgname.install
install=()
depends=('java-openjfx' 'jre8-openjdk' 'fontconfig' 'chromaprint')
makedepends=()
provides=('filebot')
conflicts=('filebot47' 'filebot-git')

[[ $CARCH == "i686" ]]   && _intarch=i686
[[ $CARCH == "x86_64" ]] && _intarch=amd64
[[ $CARCH == "armv7l" ]] && _intarch=armv7l
[[ $CARCH == "armv7h" ]] && _intarch=armv7l
[[ $CARCH == "aarch64" ]] && _intarch=armv8

source=("https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-portable.tar.xz"
        $pkgname-arch.sh $pkgname.svg $pkgname.desktop
        )

md5sums=('9e5ce2ba54b9e5ea0d6ca7446572c782'
         '7c1128f94fcd9f4e29225a12eac83704'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3'
         )

optdepends=('libzen: Required by libmediainfo'
	    'libmediainfo: Read media info such as video codec, resolution or duration'
	    'java-p7zip-binding: Extract archives'
	    'gvfs: Drag-n-Drop from GVFS remote filesystems')

prepare() {
  cd "$srcdir"
}

build() {
  cd $srcdir
}

package() {
  mkdir -p $pkgdir/usr/share/java/$pkgname/

  install -Dm644 lib/Linux-$CARCH/libjnidispatch.so "$pkgdir/usr/share/java/$pkgname/libjnidispatch.so"
  cp -dpr --no-preserve=ownership jar/* "$pkgdir/usr/share/java/$pkgname/"

  install -Dm755 $pkgname-arch.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  
}
