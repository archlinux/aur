# Maintainer: ObserverOfTime <chronobserver@disroot.org>

_tag=1.0.0-beta
pkgname=betterdiscord-installer
pkgver=1.0.0.beta
pkgrel=2
pkgdesc='Installer for BetterDiscord'
arch=('x86_64')
url='https://github.com/BetterDiscord/Installer'
license=('MIT')
replaces=('betterdiscord')
makedepends=('nodejs' 'yarn')
source=("$pkgname-$_tag.tar.gz::$url/archive/v${_tag}.tar.gz")
sha256sums=('7af763dc0e73b84690a953bf412135a079d954010e845ad422283be185959bcc')

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
    ln -s /opt/BetterDiscord/betterdiscord "$pkgdir"/usr/bin/betterdiscord
}
