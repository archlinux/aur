# Maintainer: fuero <fuerob@gmail.com>
pkgname=timewarrior-jirapush
# renovate: datasource=gitlab-releases depName=FoxAmes/timewarrior-jirapush
pkgver=0.4.1
pkgrel=1
pkgdesc="TimeWarrior Extension that uploads timewarrior intervals to Jira as work logs"
arch=('x86_64')
url="https://gitlab.com/FoxAmes/timewarrior-jirapush"
license=('MIT')
depends=('timew')
makedepends=('cargo' 'asciidoctor' 'jq')
optdepends=(
  'bugwarrior: Pull synchronisation of JIRA issues into taskwarrior'
)
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
)

sha512sums=('344c03f10698956f0b9cba150af89b195487acf00329bdc5afaa11a80a364f86363ae8758ca6bc2f9849cf3463674f182833b0e470e07cad36015a94a54788d7')

build() {
  cd "${pkgname}-v${pkgver}"

  cargo build --release --locked
}

check() {
  cd "${pkgname}-v${pkgver}"

  cargo test --release --locked
}

package() {
  cd "${pkgname}-v${pkgver}"

  install -Dm755 "target/release/jirapush" "$pkgdir/usr/bin/jirapush"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
