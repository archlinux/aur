# Maintainer: Yurii Vlasov <yuriy@vlasov.pro>
pkgname=dm-nuke
pkgver=1.3.0
pkgrel=1
pkgdesc="Decrypt smart nuke mkinitcpio hook. Supports keyfile, keyscript and nuke password that destroy LUKS headers."
arch=('x86_64' 'aarch64')
url="https://vlasov.pro/ru/p/dm-crypt-nuke/"
license=('Apache Licence 2.0')
depends=('mkinitcpio' 'whois' 'coreutils' 'cryptsetup')
makedepends=('findutils' 'coreutils')
source=('install.sh' 'run.sh' 'manpage')
noextract=()

build() {
  install -Dm 0755 install.sh etc/initcpio/install/dm-nuke
  install -Dm 0755 run.sh etc/initcpio/hooks/dm-nuke
  install -Dm 0644 manpage usr/share/man/man1/dm-nuke.1
}

package() {
  find "$srcdir" -mindepth 1 -type f -print0 | \
  xargs -0n1 realpath --relative-to="$srcdir" | \
  xargs -I% install -D % "$pkgdir/%"
}
sha256sums=('3b73bcede64123c50e828684816712b7ea5131fbab68da28cf7f6a7d97de1795' '75d125c788156bd6bfbc54803c0a2d95ad8c1b44c30b3eb409e1a5da91af40b9' 'bce180f18f22c0e7d6166165aa6236fa6eb4aad9e7a03df029b37cded4630034')
