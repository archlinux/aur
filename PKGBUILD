# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=libvss
pkgver=r383.9ff8f49
pkgrel=1
pkgdesc='High level string and text processing library for Ada'
url='https://github.com/AdaCore/VSS'
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'gcc-ada' 'gprbuild')
source=('git+https://github.com/AdaCore/VSS.git#commit=9ff8f49b9f1c801b9ff66cb538fbbf447bc1244e')
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/VSS"
    printf "r%s.%s"                        \
           "$(git rev-list  --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/VSS"
    make BUILD_MODE=prod
}

package() {
    cd "$srcdir/VSS"

    gprinstall -p -P gnat/vss_gnat.gpr -XBUILD_MODE=prod --prefix="$pkgdir/usr"
    gprinstall -p -P gnat/vss_text.gpr -XBUILD_MODE=prod --prefix="$pkgdir/usr"
    gprinstall -p -P gnat/vss_json.gpr -XBUILD_MODE=prod --prefix="$pkgdir/usr"
}
