# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=jing-git
pkgver=20220510
pkgrel=1
pkgdesc="RELAX NG validator"
url=https://github.com/relaxng/jing-trang
license=(BSD)
arch=(x86_64)
source=("git+$url"
        jing.sh)
sha256sums=('SKIP'
            'd7610d8e1446ac837f81bf0726fb7eaa3ed3d6d204bf02eb03f36aabf3ae0c00')
depends=(java-runtime)
makedepends=(git java-environment)
provides=(jing=${pkgver%+*})
conflicts=(jing)

pkgver() {
  cd jing-trang
  git describe --tags --abbrev=10 |
    sed 's/^V//; s/-/+/; s/-/./'
}

build() {
  cd jing-trang
  ./ant
}

package() {
  install -Dm755 jing.sh "$pkgdir"/usr/bin/jing
  install -dm755 "$pkgdir"/usr/share/java/jing/
  install -m644 jing-trang/build/jing.jar "$pkgdir"/usr/share/java/jing/
}
