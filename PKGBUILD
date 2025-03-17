# Maintainer: Yurii Vlasov <yuriy@vlasov.pro>
pkgname=dm-nuke
pkgver=1.2.2
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
sha256sums=('3b73bcede64123c50e828684816712b7ea5131fbab68da28cf7f6a7d97de1795' '52be09e41ae71cbf37bd1a2d3be337646982633c19f6f7aea66db9d78ba604de' '1fcfdc7c9784ab0f89abc6c90219b9382d7c3c7da1cb81c686972d11e423f83a')
