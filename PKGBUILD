# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=filtron
pkgver=0+51+93f8b22
pkgrel=1
pkgdesc='Filtering reverse HTTP proxy'
arch=(any)
url='https://github.com/asciimoo/filtron'
license=(AGPL3)
conflicts=(filtron-git)
makedepends=(git go)
optdepends=('searx: A privacy-respecting, hackable metasearch engine'
            'searx-git: A privacy-respecting, hackable metasearch engine (Git)'
            'morty: Privacy-aware web content sanitizer proxy-as-a-service'
            'morty-git: Privacy-aware web content sanitizer proxy-as-a-service (Git)')
source=(git+https://github.com/asciimoo/filtron
        filtron.service)
sha512sums=(SKIP
            0b7bbe55b3fd89d589e5662699f93d7aaf3c1d77d29be9cc568f8430e4a2491ba4920ca153f4d887a29da1f51670ec06346809cc5d1f373af540e252feccc799)

pkgver() {
  cd filtron
  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd filtron
  GOPATH=$srcdir/filtron go get -v -x github.com/asciimoo/filtron
}

package() {
  cd filtron
  install -D bin/filtron $pkgdir/usr/bin/filtron
  install -Dm 644 ../filtron.service $pkgdir/usr/lib/systemd/system/filtron.service
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/filtron/LICENSE
}
