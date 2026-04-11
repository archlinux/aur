# Maintainer:  <cradlemann@gmail.com>
pkgname=hfdownloader
pkgver=3.0.3
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
md5sums=('417799deee66d043b9d2634645a1a566')
sha256sums=('ace4d5a78abc1fe768126ac6ff3a5d40f8cbd8f97faa7446f78d032c3addb2bc')
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
