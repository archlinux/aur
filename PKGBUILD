pkgname='click-ns3-git'
_pkgname='click'
pkgver=v2.0.1.r964.g9197a59
pkgrel=1
pkgdesc="The Click modular router: fast modular packet processing and analysis."
arch=('x86_64')
url="https://github.com/kohler/click"
license=('LicenseRef-the-Click-license')
conflicts=('click-ns3')
provides=('click-ns3')
depends=('gcc-libs' 'glibc')
makedepends=('git')
source=("git+${url}.git")

sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  ./configure \
    --prefix /usr \
    --disable-linuxmodule \
    --enable-nsclick \
    --enable-wifi
  make ns userlevel
}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir" install-include install-ns install-userlevel
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

