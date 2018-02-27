# Maintainer: Jace Bennest <jacebennest87 at gmail dot com>
# Contributor: skydrome <skydrome at i2pmail dot org>
# Contributor: StevensNJD4 <github dot com slash StevensNJD4>

pkgname=lazyman
pkgver=2.3.0.20180226
pkgrel=1
pkgdesc="A simple program that lets you stream every NHL and MLB game"
arch=('any')
url="https://github.com/StevensNJD4/LazyMan"
license=('GPL2')
depends=('java-runtime>=8' 'streamlink')
makedepends=('java-environment>=8' 'apache-ant' 'git')
optdepends=('vlc: requires a video player - choose one' 'mpv: requires a video player - choose one')
backup=('usr/share/java/lazyman/config.properties')

source=('git+https://github.com/StevensNJD4/LazyMan.git#commit=30374572eed67f134cc9b54b4601233fc4b52c7b'
	'config.properties'
	"$pkgname".sh
	"$pkgname".desktop
	"$pkgname".png)

pkgver() {
    cd "$srcdir/LazyMan"
    cat VERSION
}

build() {
    cd "$srcdir/LazyMan"
    rm -rf build dist store
    ant -Dplatforms.JDK_1.8.home=/usr/lib/jvm/default jar
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir"/usr/bin
    install -dm755 "$pkgdir"/usr/share/applications
    install -dm755 "$pkgdir"/usr/share/icons
    install -dm777 "$pkgdir"/usr/share/java/lazyman
    install -dm755 "$pkgdir"/usr/share/java/lazyman/lib
    install -Dm755 lazyman.sh                "$pkgdir"/usr/bin/lazyman
    install -Dm644 lazyman.desktop           "$pkgdir"/usr/share/applications/lazyman.desktop
    install -Dm644 lazyman.png               "$pkgdir"/usr/share/icons/lazyman.png
    install -Dm777 config.properties         "$pkgdir"/usr/share/java/lazyman/config.properties
    install -Dm644 LazyMan/dist/LazyMan.jar  "$pkgdir"/usr/share/java/lazyman/LazyMan.jar
    install -Dm644 LazyMan/src/lazyman/*.jar "$pkgdir"/usr/share/java/lazyman/lib/
}

md5sums=('SKIP'
         'd41d8cd98f00b204e9800998ecf8427e'
         'b76d76bc5941418f8f3048b941fa8228'
         '298ca421d04992c9a9c224dff3a459a3'
         '41aebb968e8b6856d1b73cabd6a8c5d2')

