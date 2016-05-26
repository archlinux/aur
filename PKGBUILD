# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

_basename=rust-arm
pkgname=rust-arm-bin
pkgver=1.8.0
epoch=1
pkgrel=1
_binname=$_basename-$pkgver-bin.tar.gz
arch=(armv6h armv7h)
pkgdesc='Systems programming language focused on safety, speed and concurrency'
url='https://github.com/warricksothr/RustBuild'
license=('MIT' 'Apache')

provides=("rust=$pkgver")
conflicts=("rust")

source_armv6h=($_binname::https://www.dropbox.com/s/atfb97zynjp0uhe/rust-1.8.0-stable-2016-04-12-db29394-arm-unknown-linux-gnueabihf-ca7b144611875016d10127bf145fe11e34c40551.tar.gz)

source_armv7h=($_binname::https://www.dropbox.com/s/hx534b40k61g2gm/rust-1.8.0-stable-2016-04-12-db29394-arm-unknown-linux-gnueabihf-c4717eeb439d7c951bb32e5dea03d5a2d5b3cf4d.tar.gz)

md5sums_armv6h=('05236ff85ed07fc8395d8d831002da59')
md5sums_armv7h=('114b489e2b52f6e6655a2232ff1ae595')

noextract=("$_binname")

options=('staticlibs' '!strip')


package() {

    mkdir "$pkgdir"/usr

	tar -xf $srcdir/$_binname -C "$pkgdir"/usr

    cd "$pkgdir/usr/lib"
    rm rustlib/{components,manifest-rustc,rust-installer-version}
    ln -sf rustlib/arm-unknown-linux-gnueabihf/lib/*.so .
}
