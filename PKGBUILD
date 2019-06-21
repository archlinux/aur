# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sanoid-git
pkgver=r567.a90eec3
pkgrel=1
pkgdesc="Sanoid is a policy-driven snapshot management tool for ZFS filesystems."
arch=('any')
url='https://github.com/jimsalterjrs/sanoid'
license=('GPL')
backup=('etc/sanoid/sanoid.conf')
depends=('perl'
         'perl-capture-tiny'
         'perl-config-inifiles')
optdepends=('pv: progress bars'
            'lzop: compression'
            'mbuffer: stream buffering')
makedepends=('git')
conflicts=('sanoid')
provides=('sanoid')
source=("sanoid-git::git+https://github.com/jimsalterjrs/sanoid.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sanoid/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/sanoid/LICENSE"
  install -Dm644 sanoid.conf "${pkgdir}/etc/sanoid/sanoid.conf"
  install -Dm644 sanoid.defaults.conf "${pkgdir}/etc/sanoid/sanoid.defaults.conf"
  install -Dm755 sanoid "${pkgdir}/usr/bin/sanoid"
  install -Dm755 syncoid "${pkgdir}/usr/bin/syncoid"
  install -Dm755 findoid "${pkgdir}/usr/bin/findoid"
}
