# Maintainer : Kazumi M. <kuroclef@gmail.com>

pkgname=alice-git
pkgver=latest
pkgrel=1
pkgdesc='A minimal Twitter client based on GTK+3.'
arch=(i686 x86_64)
url=https://github.com/kuroclef/alice
license=(GPL3)
depends=(curl gtkmm3 liboauth)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git://github.com/kuroclef/alice.git)
md5sums=(SKIP)

pkgver() {
  cd "${pkgname%-git}"
  printf %s "$(date -I -ud "$(git log -1 --format=%ci)" | tr -d -)"
}

build() {
  cd "${pkgname%-git}"
tee config.h <<\EOF
#define CONSUMER_KEY        "your_consumer_key"
#define CONSUMER_SECRET     "your_consumer_secret"
#define ACCESS_TOKEN        "your_access_token"
#define ACCESS_TOKEN_SECRET "your_access_token_secret"
EOF
  make all
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" "$pkgdir"/usr/bin/"${pkgname%-git}"
  install -Dm 644 README.md         "$pkgdir"/usr/share/doc/"${pkgname%-git}"/README.md
}
