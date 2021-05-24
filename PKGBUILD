# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscord-git
pkgver=1.1.1.r1.gf8e2c2f
pkgrel=1
pkgdesc='Discord extension with plugin support, emotes, and more'
arch=('x86_64')
url='https://github.com/rauenzi/BetterDiscordApp'
license=('MIT')
provides=("${pkgname%-git}")
makedepends=('git' 'nodejs' 'npm')
source=("${pkgname%-git}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname%-git}
    npm i && npm run dist
}

package() {
    cd ${pkgname%-git}
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 dist/betterdiscord.asar "$pkgdir"/opt/BetterDiscord/betterdiscord.asar
}
