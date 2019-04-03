# Maintainer: kpcyrd <git@rxv.cc>

_gitname=badtouch
pkgname=badtouch-git
pkgver=0.6.1.r10.g190a6d5
pkgrel=1
pkgdesc="Scriptable network authentication cracker"
url="https://github.com/kpcyrd/badtouch"
depends=('openssl' 'libcap')
makedepends=('cargo' 'git')
provides=('badtouch')
conflicts=('badtouch')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
install='badtouch.install'
source=("git+https://github.com/kpcyrd/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  cargo build --release --locked
}

check() {
  cd "${_gitname}"
  cargo test --release --locked
}

package() {
  cd "${_gitname}"
  install -Dm755 "target/release/${_gitname}" -t "${pkgdir}/usr/bin"
  install -Dm644 docs/badtouch.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 scripts/* -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
