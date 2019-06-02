# Maintainer: RedTide <redtid3@gmail.com>

pkgname=sfizz-git
pkgver=r5.4d45914
pkgrel=1
pkgdesc="Juce based SFZ format sampler"
url="https://github.com/redtide/sfizz"
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'juce')
source=(
    "$pkgname"::"git+https://github.com/redtide/sfizz"
    "Makefile"
)
md5sums=(
    'SKIP'
    '00f1db42f1beed7ae40dae6e9932127a'
)
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cp -f Makefile $srcdir/$pkgname/Builds/LinuxMakefile/
    cd "$srcdir/$pkgname/Builds/LinuxMakefile"
    make INSTALL_DIR=$pkgdir
}
package() {
    cd "$srcdir/$pkgname"
    install -D -m644 $srcdir/$pkgname/bundle/linux/sfizz.desktop $pkgdir/usr/share/applications/sfizz.desktop
    install -D -m644 $srcdir/$pkgname/resources/icons/sfizz.png $pkgdir/usr/share/pixmaps/sfizz.png
    install -D -m755 $srcdir/$pkgname/Builds/LinuxMakefile/build/sfizz $pkgdir/usr/bin/sfizz
}
