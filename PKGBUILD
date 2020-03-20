# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.9.0
pkgrel=1
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
install=$pkgname.install
# install=()
depends=('java8-openjfx' 'jre8-openjdk' 'fontconfig' 'chromaprint')
makedepends=()
provides=('filebot')
conflicts=('filebot47' 'filebot-git')

[[ $CARCH == "i686" ]]   && _intarch=i686
[[ $CARCH == "x86_64" ]] && _intarch=amd64
[[ $CARCH == "armv7l" ]] && _intarch=armv7l
[[ $CARCH == "armv7h" ]] && _intarch=armv7l
[[ $CARCH == "aarch64" ]] && _intarch=armv8

source=(#"https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-portable.tar.xz"
        "https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz"
        $pkgname-arch.sh
        #$pkgname.svg
        #$pkgname.desktop
        )

md5sums=('6fc1123a1bae8ccf9544ccac82546186'
         '3506d0f6c990fb918e91337c634ba70c')

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
  
  install -Dm755 $pkgname-arch.sh "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/usr/share"

  install -Dm644 $pkgname/lib/$CARCH/libjnidispatch.so "$pkgdir/usr/share/java/$pkgname/libjnidispatch.so"
  cp -dpr --no-preserve=ownership $pkgname/jar/* "$pkgdir/usr/share/java/$pkgname/"

  cp -dpr --no-preserve=ownership icons/* "$pkgdir/usr/share/icons/"

  #install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  #install -Dm644 icons/hicolor/scalable/apps/$pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"

  #install -Dm644 applications/*.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  mkdir -p $pkgdir/usr/share/applications/
  cp -dpr --no-preserve=ownership applications/* "$pkgdir/usr/share/applications/"

  mkdir -p $pkgdir/usr/share/mime/packages/
  cp -dpr --no-preserve=ownership mime/* "$pkgdir/usr/share/mime/"
  
}
