# Maintainer: Jace Bennest <jacebennest87 at gmail dot com>
# Contributor: StevensNJD4 <github dot com slash StevensNJD4>

pkgname=lazyman-git
pkgver=2.3.0.20180222
pkgrel=1
pkgdesc="A simple program that lets you stream every NHL and MLB game"
url="https://github.com/StevensNJD4/LazyMan"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'streamlink' 'mpv')
makedepends=('java-environment>=8' 'apache-ant' 'git')
backup=('usr/share/java/lazyman/config.properties')

source=('git+https://github.com/StevensNJD4/LazyMan.git'
        'config.properties'
        'lazyman.sh'
	    'lazyman.desktop'
	    'lazyman.png')
md5sums=('SKIP'
         '401d37812b1a6a9c699a4ec574732148'
         'b76d76bc5941418f8f3048b941fa8228'
         '1b259947cc8e14cd1b0bcad4d05094d9'
         '41aebb968e8b6856d1b73cabd6a8c5d2')

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
