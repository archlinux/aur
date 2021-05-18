# Maintainer: imp0 <jan <(@)> siteworld <(.)> be>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=helvum
pkgver=0.2.0
pkgrel=1
pkgdesc='GTK-based patchbay for pipewire, inspired by the JACK tool catia'
arch=('x86_64')
url='https://gitlab.freedesktop.org/ryuukyu/helvum'
license=('GPL3')
depends=('gtk4' 'pipewire')
makedepends=('rust' 'clang')
provides=('helvum')
conflicts=('helvum-git')
source=("https://gitlab.freedesktop.org/ryuukyu/helvum/-/archive/${pkgver}/helvum-${pkgver}.tar.gz")
sha512sums=('990a420ea837c13b216abe1cbbd7ba738a5b0b4d5793c9f2d7f55a6ad1369c2ff6ff67a176df0036d27e1e85577a9e915ad0ded2238d82cf83d1d584b7cb62da')

build() {
  cd "helvum-${pkgver}"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "helvum-${pkgver}"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
