# Maintainer: Philipp Klein <philipptheklein@gmail.com>
pkgname=gdrive
pkgver=1.6.1
pkgrel=2
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
sha256sums=('50d5851c6f6cfa52713c001dae03a2c189ee3d9a255e8bf58ce8d4dadab5b9fc')
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
