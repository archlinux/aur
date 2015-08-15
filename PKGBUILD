# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=("zopfli-git" "libzopfli-git" "zopflipng-git" "libzopflipng-git")
pkgver=1.0.0.r31.g6ff3ba2
pkgrel=1
arch=('i686' 'x86_64' 'ARM')
url="https://github.com/google/zopfli"
license=('Apache')
makedepends=('git')
depends=('gcc-libs')
provides=('zopflipng' 'zopfli' 'libzopfli' 'libzopflipng')
source=('git+https://github.com/google/zopfli.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/zopfli"
    git describe | sed -r 's/zopfli-//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd "$srcdir/zopfli"
    make zopfli 
    make libzopfli 
    make zopflipng 
    make libzopflipng
}

package_zopflipng-git() {
    pkgdesc="PNG optimisation tool using Google's zopfli library, git version."
    cd "$srcdir/zopfli"
    install -Dm755 zopflipng "${pkgdir}/usr/bin/zopflipng"
}

package_libzopflipng-git() {
    pkgdesc="PNG optimisation library using Google's zopfli library, git version."
    cd "$srcdir/zopfli"
    _libname=$(find . -name "libzopflipng.so.*" -print)
    install -D $_libname "${pkgdir}/usr/lib/$_libname"
    ln -s "${pkgdir}/usr/lib/$_libname" "${pkgdir}/usr/lib/libzopflipng.so"
}

package_libzopfli-git() {
    pkgdesc="Compression library by Google, git version."
    cd "$srcdir/zopfli"
    _libname=$(find . -name "libzopfli.so.*" -print)
    install -D $_libname "${pkgdir}/usr/lib/$_libname"
    ln -s "${pkgdir}/usr/lib/$_libname" "${pkgdir}/usr/lib/libzopfli.so"
}

package_zopfli-git() {
    pkgdesc="Compression utility by Google, git version."
    cd "$srcdir/zopfli"
    install -Dm755 zopfli "${pkgdir}/usr/bin/zopfli"
}