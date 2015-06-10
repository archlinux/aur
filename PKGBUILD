# Maintainer: Philipp Klein <philipptheklein@gmail.com>
pkgname=gdrive
pkgver=1.8.0
pkgrel=1
pkgdesc="Command line utility for uploading and downloading single files to your Google Drive"
arch=('x86_64' 'i686')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
groups=()
depends=()
makedepends=(git go mercurial)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/prasmussen/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c68ca12c9e6f585f2ac7c13cb36839503bb29df96b5713c865d2829ee2ece6b0')
noextract=()
_gourl="github.com/prasmussen/gdrive"

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    GOPATH="$srcdir" go get -fix -v -x $_gourl
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    GOPATH="$srcdir" go build -o "$srcdir/bin/$pkgname"
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin"
    install -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:sw=4:ts=4:et
