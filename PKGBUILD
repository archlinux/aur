# Maintainer:  <cradlemann@gmail.com>
pkgname=hfdownloader
pkgver=3.3.0
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
md5sums=('4f6a0998e954e0173c51c156c0be3cd5')
sha256sums=('c98b08ab9e689a7b5e7afa5c6a49f068daf4bbc60e92e457a87cecff615e4297')
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
