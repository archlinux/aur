# Maintainer: Tun Win Naing <tunwn.mdy@gmail.com>

pkgname=dev-tld-resolver-git
_pkgname=dev-tld-resolver
pkgver=r12.g4924eff
pkgrel=1
pkgdesc="Simple top level domain (NSSwitch hosts) resolver for linux based development environment."
arch=('any')
url="https://github.com/puma/dev-tld-resolver"
install=dev-tld-resolver.install
license=('MIT')
depends=('glibc')
source=("git+https://github.com/puma/dev-tld-resolver.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"/src

  make
}

package () {
  cd "${srcdir}/${_pkgname}"/src
  install -Dm755 libnss_dev_tld.so.2 "${pkgdir}/usr/lib/libnss_dev_tld.so.2"

  cd "${srcdir}/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
