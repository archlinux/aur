# Maintainer: Yurii Vlasov <yuriy@vlasov.pro>
pkgname=dm-nuke
pkgver=1.2.0
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
sha256sums=('3b73bcede64123c50e828684816712b7ea5131fbab68da28cf7f6a7d97de1795' 'aa54fbe42f62d289d07bc88af6223c9f518ee810c6bcf0726e31a4c8cecb2846' '4c237fb10a7a6b2c9ae73a25d25563639f2f770a1f8e3d646ed09a580891b3be')
