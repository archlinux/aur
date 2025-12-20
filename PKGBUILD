# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=galene-stt
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="Real-time speech-to-text support for Galene"
arch=('i686' 'x86_64')
url='https://galene.org'
license=('MIT')
depends=('go' 'opus' 'whisper.cpp')
optdepends=('whisper.cpp-model-medium: a model for whisper.cpp'
            'whisper.cpp-model-large: a model for whisper.cpp')
source=("https://github.com/jech/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('a84dcdca9254e01d9eb470ddff1ef0d5dec41a5870618d5389d4832193703ab3')

prepare() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  mkdir -p _build
}

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  go build \
     -trimpath \
     -buildmode=pie \
     -mod=readonly \
     -modcacherw \
     -ldflags "-s -w" \
     -o _build \
     ./...
}

check() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "_build/galene-stt" "${pkgdir}/usr/bin"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
