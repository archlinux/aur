# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscord-git
pkgver=1.9.2.r4.geb814160
pkgrel=1
pkgdesc='Discord extension with plugin support, emotes, and more'
arch=('x86_64')
url='https://github.com/BetterDiscord/BetterDiscord'
license=('MIT')
provides=("${pkgname%-git}")
makedepends=('git' 'nodejs' 'pnpm')
source=("${pkgname%-git}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname%-git}
    pnpm i && pnpm run dist
}

package() {
    cd ${pkgname%-git}
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 dist/betterdiscord.asar "$pkgdir"/opt/BetterDiscord/betterdiscord.asar
}
