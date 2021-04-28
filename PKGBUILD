# Maintainer: Jace Bennest <jacebennest87 at gmail dot com>
# Contributor: skydrome <skydrome at i2pmail dot org>
# Contributor: Adrian Wheeldon <arandomowl at gmail dot com>
# Contributor: StevensNJD4 <github dot com slash StevensNJD4>

pkgname=lazyman
pkgver=2.4.0.20210405
pkgrel=1
pkgdesc="A simple program that lets you stream every NHL and MLB game"
arch=('any')
url='https://github.com/StevensNJD4/LazyMan'
license=('GPL2')
depends=('java-runtime>=8' 'streamlink')
optdepends=('vlc: video player - choose one' 'mpv: video player - choose one')
backup=('usr/share/java/lazyman/config.properties')

source=("$url/releases/download/$pkgver/Mac_Linux.zip"
	"config.properties"
	"$pkgname.sh"
	"$pkgname.desktop"
	"$pkgname.png")

_proxypath='usr/share/java/lazyman/mlbamproxy/linux'

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm777 "$pkgdir/usr/share/java/lazyman"

    install -Dm755 lazyman.sh        "$pkgdir/usr/bin/lazyman"
    install -Dm644 lazyman.png       "$pkgdir/usr/share/icons/lazyman.png"
    install -Dm644 lazyman.desktop   "$pkgdir/usr/share/applications/lazyman.desktop"
    install -Dm666 config.properties "$pkgdir/usr/share/java/lazyman/config.properties"

    for ARCH in arm x86 amd64 ppc64le; do   
      install -Dm755 mlbamproxy/linux/$ARCH/mlbamproxy "$pkgdir/$_proxypath/$ARCH/mlbamproxy"
    done

    install -Dm644 LazyMan.jar "$pkgdir/usr/share/java/lazyman/LazyMan.jar"
}

md5sums=('96fe71326bc2ee7c1c74e5453b133582'
         'd41d8cd98f00b204e9800998ecf8427e'
         'b387dc6c2bdf54718d6d2e48f9f37e3d'
         'cc5998a228727420cbf7d07fc5318920'
         '41aebb968e8b6856d1b73cabd6a8c5d2')
