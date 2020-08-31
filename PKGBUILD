# Maintainer: Antoine Damhet <xdbob@lse.epita.fr>

_pkgname=poweralertd
pkgname=${_pkgname}-git
pkgver=r26.5d346a8
pkgrel=2
pkgdesc="Power alert notifications daemon"
arch=('i686' 'x86_64')
url='https://kl.wtf/projects/poweralertd'
license=('GPL3')
makedepends=('git' 'meson' 'scdoc')
depends=('systemd-libs' 'upower')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://git.sr.ht/~kennylevinsen/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  arch-meson build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="${pkgdir}" ninja -C build install
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
