# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=oligoarrayaux
pkgver=3.8.1
pkgrel=1
pkgdesc="A subset of the UNAFold package for use with OligoArray"
arch=('i686' 'x86_64')
url="http://www.unafold.org/Dinamelt/software/oligoarrayaux.php"
license=('Custom:Academic Non-Commercial Use')
depends=('perl')
source=("http://www.unafold.org/download/oligoarrayaux-${pkgver}.tar.gz")
sha256sums=('b635bcf8c3e8bc154f3b2db8c0147e0ef22bb17bcc4ed8c2c23cc3c6d2d1a5f2')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr  CFLAGS='-O2' LDFLAGS="-Wl,-z,now -Wl,-z,relro"
}

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
    install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
