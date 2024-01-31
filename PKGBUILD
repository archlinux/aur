# Maintainer: RubixDev <silas dot groh at t-online dot de>
# Contributer: Yacob Zitouni <yacob.zitouni@gmail.com>
pkgname=('bannertool')
pkgver=1.2.0
pkgrel=3
pkgdesc="A tool for creating 3DS banners"
arch=('i686' 'x86_64')
url="https://github.com/Steveice10/bannertool/"
license=('MIT')
depends=('zip')
makedepends=('git')
sha256sums=('SKIP' 'SKIP')

source=("$pkgname::git+https://github.com/Steveice10/bannertool.git#tag=1.2.0"
        'buildtools::git+https://github.com/Steveice10/buildtools.git#commit=b7043ff')


prepare() {
    cd "$pkgname"
    git config submodule.buildtools.url "$srcdir/buildtools"
    git -c protocol.file.allow=always submodule update --init
}

build() {
    cd "$srcdir/$pkgname/"
    make
}

package() {
    install -D "$srcdir/$pkgname/output/linux-$CARCH/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
