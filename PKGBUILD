
#    Maintainer: J. Emiliano Deustua <edeustua@gmail.com>
# Co-maintainer: Gabriel Brown <gabriel.h.brown@gmail.com>

pkgname=chapel
pkgver=1.29.0
pkgrel=1
pkgdesc="Programming language designed for productive parallel computing at scale"
url="https://chapel-lang.org/"
arch=('x86_64' 'arm')
license=('Apache')
depends=('python' 'perl' 'llvm' 'clang')
makedepends=('git' 'cmake')
source=("https://github.com/chapel-lang/chapel/releases/download/${pkgver}/chapel-${pkgver}.tar.gz")
sha256sums=('f87bc7285c4641ed540f806c63ab904137b650b1e232a11c15f76e874e079804')
            

build() {
        cd "$srcdir/${pkgname}-${pkgver}"
        ./configure --prefix=/usr
        make
}

check() {
        cd "$srcdir/${pkgname}-${pkgver}"
        export PATH="$srcdir/${pkgname}-${pkgver}/bin/linux64-x86_64:$PATH"
        make check
}

package() {
        cd "$srcdir/${pkgname}-${pkgver}"
        make DESTDIR="${pkgdir}" install
}
