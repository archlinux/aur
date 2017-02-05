# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Gonzalo Lorca <human at vtr.net>

pkgname=default_arm7
pkgver=0.7.1
pkgrel=1
pkgdesc="A very useful library for Nintendo DS homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom')
depends=('libnds' 'dswifi' 'maxmod')
options=(!strip)
source=($pkgname-src-$pkgver.tar.gz::"https://github.com/devkitPro/default-arm7/archive/v$pkgver.tar.gz")
sha256sums=('ecd23ced4d5fa1eb7f7702bca45a652e87bfdfbe460a909ec8e37b7637f2106f')

build() {
  # set environment
  source /etc/profile.d/devkitarm.sh

  make -C ${pkgname/_/-}-$pkgver
}

package() {
  cd ${pkgname/_/-}-$pkgver
  install -Dm755 default.elf "$pkgdir"/opt/devkitpro/libnds/default.elf
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 29 source/main.c > "$pkgdir"/usr/share/licenses/$pkgname/license
}
