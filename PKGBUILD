# Maintainer: Mohamed Feddad <mrf345@gmail.com>

pkgname=hfdownloader-git
pkgver=r72.cbf2f5e
pkgrel=1
pkgdesc="Simple go utility to download HuggingFace Models and Datasets"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/bodaay/HuggingFaceModelDownloader/"
license=('Apache-2.0')
source=("git+$url")
depends=('glibc')
makedepends=('go')
provides=("hfdownloader")
sha256sums=('SKIP')
dirname=HuggingFaceModelDownloader

pkgver() {
    cd "${srcdir}/${dirname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${dirname}"
    CGO_ENABLED=0 GOOS=linux go build -o ${pkgname%-git}.bin  main.go
}

package() {
    cd "${srcdir}/${dirname}"
    install -Dm755 ${pkgname%-git}.bin "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
