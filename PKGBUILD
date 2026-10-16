# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Pavol Hluchy (Lopo) <lopo at losys dot eu>
# Based on http://ftp.linux.org.tr/slackware/slackware_source/a/zoo/zoo.SlackBuild

pkgname=zoo
pkgver=2.10.r133.g2b2f9b6
pkgrel=3
pkgdesc="archiving and compressing utility"
url='https://github.com/troglobit/zoo'
license=('Unlicense')
arch=('i686' 'x86_64')
depends=('glibc')
source=(git+https://github.com/troglobit/${pkgname}.git)
sha512sums=('SKIP')
options=(!debug zipman)

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname}"
    ./autogen.sh
    ./configure --enable-fiz --enable-ooz CFLAGS=-std=gnu89
    make
}

package() {
	cd "$srcdir/${pkgname}"
    install -Dm755 "src/zoo" "${pkgdir}/usr/bin/zoo"
    install -Dm755 "src/fiz" "${pkgdir}/usr/bin/fiz"
    install -Dm755 "src/ooz" "${pkgdir}/usr/bin/ooz"
    install -Dm755 "src/unzoo" "${pkgdir}/usr/bin/unzoo"
    # man pages
    install -Dm644 "man/fiz.1" "${pkgdir}/usr/share/man/man1/fiz.1"
    install -Dm644 "man/unzoo.1" "${pkgdir}/usr/share/man/man1/unzoo.1"
    install -Dm644 "man/zoo.1" "${pkgdir}/usr/share/man/man1/zoo.1"
}
