# Maintainer: fuero <fuerob@gmail.com>
pkgname=timewarrior-jirapush
# renovate: datasource=gitlab-releases depName=FoxAmes/timewarrior-jirapush
pkgver=0.6.0
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

sha512sums=('42ea4864bde80e890d625db5c15d5f7529f77ee0901609615a47fa242befbabf092666f10ae71ec83b822b528b24898565560ab833376b2dd9b16c652ac36740')

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
