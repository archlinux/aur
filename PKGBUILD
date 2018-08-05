# Maintainer: Dennis Schubert <mail@dennis-schubert.de>

pkgname="hooktor"
pkgver=0.1.0
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
sha512sums=('f9e8fad1a313928fa5936e0d67c9088f3140a12ab65125a92a28e84be8a7d5ffa2bbf3bcdb77dd078270e2d307fe1f94a2f51433df820a6e8cc5c21b0b93645d'
            'a07c88803de4505bfa32c66b0f69b2cf7ed1b6f96525f0444a87c27189444a15b0fd02888d6b8c14acf33d90d2ea86b4bba9a1fff1e519775bf00f98497b2fdb'
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

