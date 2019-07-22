pkgname="picsum-git"
pkgver=r296.7cc0d8c
pkgrel=1
pkgdesc='Lorem Ipsum... but for photos.'
arch=('x86_64' 'i686')
url='https://picsum.photos'
makedepends=('vips' 'git' 'go')
depends=('vips')
license=('MIT')
source=('git+https://github.com/DMarby/picsum-photos.git')
md5sums=('SKIP')

pkgver() {
  cd picsum-photos
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/picsum-photos"
    go build -gcflags "all=-trimpath=$PWD" \
        -asmflags "all=-trimpath=$PWD" \
        -ldflags "-extldflags $LDFLAGS" \
        -o picsum-photos .
}

package() {
    cd "$srcdir/picsum-photos"
    install -Dm755 picsum-photos "${pkgdir}/usr/bin/picsum-photos"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
