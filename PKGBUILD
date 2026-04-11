# Maintainer:  <cradlemann@gmail.com>
pkgname=hfdownloader
pkgver=3.0.4
pkgrel=1
pkgdesc="Simple go utility to download HuggingFace Models and Datasets"
arch=('i686' 'x86_64')
url="https://github.com/bodaay/HuggingFaceModelDownloader"
license=('Apache 2.0')
depends=('glibc')
makedepends=('go')
provides=("hfdownloader")
conflicts=("hfdownloader-git")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('62b379c3f433a0b3cffe9865e1b00b3b')
sha256sums=('0c656989f40a7c2d4a918854d27224ca720f8df0228449be8cb59b5887053ced')
_dirname=HuggingFaceModelDownloader

build() {
    cd "${srcdir}/${_dirname}-${pkgver}"
    CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o ${pkgname}.bin ./cmd/hfdownloader
}

package() {
    cd "${srcdir}/${_dirname}-${pkgver}"
    install -Dm755 ${pkgname}.bin "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
