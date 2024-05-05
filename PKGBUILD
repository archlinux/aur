# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=fastcompmgr-git
pkgver=0.2.r1.gbd5a171
pkgrel=1
pkgdesc="fastcompmgr is a fast compositor for X, a fork of an early version of Compton"
arch=(x86_64)
url='https://github.com/tycho-kirchner/fastcompmgr'
license=('custom')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'libxext')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "${pkgname%-*}"
  make
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 "${pkgname%-*}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${pkgname%-*}".1 -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
