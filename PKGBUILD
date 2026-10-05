# Maintainer:  <cradlemann@gmail.com>
pkgname=hfdownloader
pkgver=3.4.0
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
md5sums=('04610fb17251db4bfc10e7822e7390a5')
sha256sums=('7bdd1839fa01822682162044af4face315140383b61d4def92fd8f593d9f818a')
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
