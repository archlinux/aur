# Maintainer: Cullen Ross <cullenrss@gmail.com>

_pkgname='taskwarrior-tui'
pkgname="${_pkgname}-git"
pkgver=r146.fad4e5f
pkgrel=1
arch=('any')
license=('MIT')
makedepends=('git' 'rust')
depends=('task')
provides=('taskwarrior-tui')
conflicts=('taskwarrior-tui')
pkgdesc="A Terminal User Interface for Taskwarrior"
url="https://github.com/kdheepak/${_pkgname}"
source=("git+https://github.com/kdheepak/taskwarrior-tui")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/${_pkgname}
  cargo build --release
}

package() {
  cd $srcdir/${_pkgname}
  install -D -m 755 "$srcdir/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${_pkgname}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${_pkgname}"
}

