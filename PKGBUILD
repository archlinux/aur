# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=da2013ctl
pkgver=1.0
pkgrel=1
pkgdesc="Alternative to razercfg for the DeathAdder 2013"
arch=('i686' 'x86_64')
url="https://github.com/Streetwalrus/da2013ctl"
license=('MIT')
depends=('libsystemd')
makedepends=('cargo')
source=("https://github.com/Streetwalrus/da2013ctl/archive/v$pkgver.tar.gz")
md5sums=('c00c106c364d258167557975638c120d')
install='da2013ctl.install'

build() {
  cd "${srcdir}/da2013ctl-$pkgver"
  cargo build --release
}

package() {
  cd "${srcdir}/da2013ctl-$pkgver"
  cargo install --root ${pkgdir}/usr
  rm ${pkgdir}/usr/.crates.toml
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -m644 50-da2013.rules ${pkgdir}/usr/lib/udev/rules.d
}

# vim:set ts=2 sw=2 et:
