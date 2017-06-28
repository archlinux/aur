# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=da2013ctl-git
pkgver=20170628.7b90d3f
pkgrel=1
pkgdesc="Alternative to razercfg for the DeathAdder 2013"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Streetwalrus/da2013ctl"
license=('MIT')
depends=('libsystemd')
provides=('da2013ctl')
conflicts=('da2013ctl')
makedepends=('git' 'cargo')
source=('git+https://github.com/Streetwalrus/da2013ctl.git')
md5sums=('SKIP')
install='da2013ctl.install'

pkgver() {
  cd "${srcdir}/da2013ctl"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/da2013ctl"
  cargo build --release
}

package() {
  cd "${srcdir}/da2013ctl"
  cargo install --root ${pkgdir}/usr
  rm ${pkgdir}/usr/.crates.toml
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -m644 50-da2013.rules ${pkgdir}/usr/lib/udev/rules.d
}

# vim:set ts=2 sw=2 et:
