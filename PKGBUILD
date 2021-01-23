# Maintainer: J. Emiliano Deustua <edeustua@gmail.com>

pkgname=chapel
pkgver=1.23.0
pkgrel=1
pkgdesc="Programming language designed for productive parallel computing at scale"
url="https://chapel-lang.org/"
arch=('x86_64')
license=('Apache')
options=('libtool' 'staticlibs')
groups=('base-devel')
makedepends=('glibc')
depends=('python' 'perl')
source=("https://github.com/chapel-lang/chapel/releases/download/${pkgver}/chapel-${pkgver}.tar.gz")
sha256sums=('7ae2c8f17a7b98ac68378e94a842cf16d4ab0bcfeabc0fee5ab4aaa07b205661')

build() {
        cd "$srcdir/${pkgname}-${pkgver}"
        ./configure --prefix=/usr
        make
}

check() {
        cd "$srcdir/${pkgname}-${pkgver}"
        export PATH="$srcdir/${pkgname}-${pkgver}/bin/linux64-x86_64:$PATH"
        echo $PATH
        make check
}

package() {
        cd "$srcdir/${pkgname}-${pkgver}"
        make DESTDIR="${pkgdir}" install
}
