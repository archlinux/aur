# Maintainer: Yurii Vlasov <yuriy@vlasov.pro>
pkgname=dm-nuke
pkgver=1.0.0
pkgrel=2
pkgdesc="Decrypt smart nuke mkinitcpio hook"
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
sha256sums=('3b73bcede64123c50e828684816712b7ea5131fbab68da28cf7f6a7d97de1795' '96bf9ad2a4d3fabd6733793d38f32a038e8d87396210cf3933c85d10819601af' 'ad56b965d41ecf651c4e72519c4bb73975f06144081e84683a3e3f55ac283ca6')
