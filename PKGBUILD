pkgname=stormycloud-vanity-git
pkgver=r53.g3e012ee
pkgrel=1
pkgdesc='GPU-accelerated vanity I2P and Tor v3 address generator'
arch=('x86_64')
url='https://github.com/StormyCloudInc/Vanity-Generator'
license=('MIT')
options=('!debug')
depends=('vulkan-headers')
makedepends=(
  'git'
  'go'
  'gcc'
  'pkgconf'
)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/Vanity-Generator"

  printf 'r%s.g%s\n' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/Vanity-Generator"

  GOOS=linux GOARCH=amd64 CGO_ENABLED=1 \
    go build -trimpath -ldflags '-s -w' -o vanitygenerator .
}

package() {
  cd "$srcdir/Vanity-Generator"

  install -Dm755 vanitygenerator \
    "$pkgdir/usr/bin/stormycloud-vanitygenerator"
}

# Please help me making the PKGBUILD better.
