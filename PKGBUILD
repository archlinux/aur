# Maintainer: Kevin Schoon <kevinschoon@pm.me>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
pkgname=pomo
pkgver=0.9.1
pkgrel=1
pkgdesc='Pomodoro CLI with todo tasks'
url='https://github.com/Felixoid/pomo'
arch=(x86_64 aarch64)
license=(MIT)
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=(
  79c262f97998470f5bdd5e3b1d776e74543f22d87d97c0470d826fd1ef91bbd9a300969a6041781a7225d2ad30a6f0abf43dc89d169ae58f1e08a12f6ad9ea77
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make VERSION=${pkgver} build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  gzip -f -k man/pomo.1
  install -Dm 755 bin/pomo "$pkgdir/usr/bin/pomo"
  install -Dm 644 man/pomo.1.gz "$pkgdir/usr/share/man/man1/pomo.1.gz"
}
