# Maintainer: ObserverOfTime <chronobserver@disroot.org>

_tag=1.0.0-hotfix
pkgname=betterdiscord-installer
pkgver=1.0.0.hotfix
pkgrel=2
pkgdesc='Installer for BetterDiscord'
arch=('x86_64')
url='https://github.com/BetterDiscord/Installer'
license=('MIT')
replaces=('betterdiscord')
makedepends=('nodejs' 'yarn')
source=("$pkgname-$_tag.tar.gz::$url/archive/v${_tag}.tar.gz")
sha256sums=('c06a30f8c77dc41dfff2e88b5f9f02e8ece2240f7abe7fb51dfa9e6238836a95')

pkgver() {
    printf '%s' "${_tag/-/.}"
}

build() {
    cd Installer-$_tag
    yarn && yarn dist:dir
}

package() {
    cd Installer-$_tag
    mkdir -p "$pkgdir"/usr/bin "$pkgdir"/opt
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    cp --preserve=mode -r dist/linux-unpacked "$pkgdir"/opt/BetterDiscord
    ln -s /opt/BetterDiscord/betterdiscord-installer "$pkgdir"/usr/bin
}
