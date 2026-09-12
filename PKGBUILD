pkgname=cnake
pkgver=1.0.0
pkgrel=1
pkgdesc="Another Linux larping program which is a snake game but it plays automatically"
arch=('x86_64')
url='https://github.com/Merfilek/cnake'
license=('MIT')
depends=('glibc')
makedepends=('dotnet-sdk-10.0')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/cnake/cnake"

    dotnet publish \
        -c Release \
        -r linux-x64 \
        --self-contained true \
        -p:PublishAot=true \
        -p:StripSymbols=true \
        -o "$srcdir/publish"
}

package() {
    install -Dm755 "$srcdir/publish/cnake" \
        "$pkgdir/usr/bin/cnake"
}
