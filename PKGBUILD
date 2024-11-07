# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=catalyst-browser-bin
pkgver=3.9.4
pkgrel=1
pkgdesc="A minimal, functional, and customizable user-focused FOSS web browser "
arch=('x86_64')
url="https://getcatalyst.eu.org"
license=('MIT')
makedepends=('asar')
conflicts=('catalyst-browser-rc-bin')
source=("https://github.com/CatalystDevOrg/Catalyst/releases/download/v${pkgver}/catalyst_${pkgver}_amd64.deb")
sha512sums=("e5288a66108b61471685b08df4c8877981f7025d5b9ea43c0d51a0c9affec3377687508be73f483307f25d1b40c82a099fc4caf35b6682549d779f1544630e2b")

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
