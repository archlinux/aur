# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=catalyst-browser-bin
pkgver=3.9.2
pkgrel=1
pkgdesc="A minimal, functional, and customizable user-focused FOSS web browser "
arch=('x86_64')
url="https://getcatalyst.eu.org"
license=('MIT')
makedepends=('asar')
conflicts=('catalyst-browser-rc-bin')
source=("https://github.com/CatalystDevOrg/Catalyst/releases/download/v${pkgver}/catalyst_${pkgver}_amd64.deb")
md5sums=("653222e25ca3dee862ec12e8ab6eedc7")

prepare() {
  tar -xf data.tar.xz
  asar extract opt/catalyst/resources/app.asar asar
  sed -i 's/catalyst-default-distrib/catalyst-default-archlinux/g' asar/src/index.html
  asar pack asar opt/catalyst/resources/app.asar
}

package() {
  cp -r "usr" "$pkgdir"
  mkdir -p "$pkgdir/opt"
  cp -r opt/* "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf "$pkgdir/opt/catalyst/catalyst" "$pkgdir/usr/bin/catalyst"
}
