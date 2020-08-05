# Maintainer: Paul Boyd <boyd.paul2@gmail.com>
pkgname=amfora
pkgver=1.4.0
pkgrel=1
pkgdesc='A fancy terminal browser for the Gemini protocol'
arch=('x86_64')
url='https://github.com/makeworld-the-better-one/amfora'
license=('GPL3')
makedepends=('go' 'git')
depends=('glibc')
optdepends=('desktop-file-utils: for desktop integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/makeworld-the-better-one/amfora/archive/v$pkgver.tar.gz")
sha256sums=('140a613659f1df03a314093363e5fdf87e3529ea46f5f2533211b2a8f11b54a0')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags \"${LDFLAGS}\""
}

package() {
    cd "$pkgname-$pkgver"
    install -D amfora "$pkgdir/usr/bin/amfora"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D amfora.desktop "$pkgdir/usr/share/applications/amfora.desktop"
}
