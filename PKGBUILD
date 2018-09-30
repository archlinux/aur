# Maintainer: Dennis Schubert <mail@dennis-schubert.de>

pkgname="hooktor"
pkgver=0.3.0
pkgrel=1
pkgdesc="A small webhook reactor."
arch=("x86_64")
url="https://github.com/denschub/hooktor"
license=("MIT")
makedepends=("nodejs" "npm")
options=("!strip")
backup=("etc/hooktor.json")
install="hooktor.install"
source=("https://github.com/denschub/hooktor/archive/v${pkgver}.tar.gz"
        "hooktor.json"
        "hooktor.service")
sha512sums=('14fd3a694201cc1ca5451f0321b422cd9201195ac0371a28e65d0f7fa0ec19e297ea09de89631f81999f1d8bb527a55ebd5ef3e4e257abe6d5e5d0f21fb0eaae'
            'fe9466353a239556965a63992d96185d46670bf579a755353ae358e7991215b8278b621fe5d3f4e63e63923279d981c4f3e7491201a65d42f8fa4c1684b1eed3'
            'bf5789ad379848620f678b17585ccc0825d9f25356516e53315f77287ed984b5a9a2f02ff8d450d100adf2f3efadf51a11ad52b729e0020348a10be7c77ae772')

build() {
  cd "$srcdir/hooktor-${pkgver}"

  npm install
  ./node_modules/.bin/pkg --targets latest-linux-x64 .
}

package() {
  cd "$srcdir/hooktor-${pkgver}"

  install -dm755 ${pkgdir}/var/lib/hooktor
  install -dm755 ${pkgdir}/var/lib/hooktor/projects
  install -Dm755 hooktor ${pkgdir}/usr/bin/hooktor
  install -Dm644 ${srcdir}/hooktor.json ${pkgdir}/etc/hooktor.json
  install -Dm644 ${srcdir}/hooktor.service ${pkgdir}/usr/lib/systemd/system/hooktor.service
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

