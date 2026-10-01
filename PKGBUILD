# Maintainer: HMK
pkgname=gsocket-git
pkgver=1.4.43.r3.g232e2b6
pkgrel=2
pkgdesc='Allows two users behind NAT/Firewall to establish a TCP connection with each other.'
url='https://github.com/hackerschoice/gsocket'
arch=('any')
license=('custom')
makedepends=('git')
source=("$pkgname::git+https://github.com/hackerschoice/gsocket#branch=master")
md5sums=('SKIP')
conflicts=('gsocket')
provides=('gsocket')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}/"
  for PR_NUM in 127 126 125 108; do curl -L https://github.com/hackerschoice/gsocket/pull/$PR_NUM.diff | git apply || true; done
  ./bootstrap && ./configure --prefix="${pkgdir}"/usr --sysconfdir="${pkgdir}"/etc
  make install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/gsocket/
  install -Dm 644 README.md -t "${pkgdir}"/usr/share/licenses/gsocket/
}

