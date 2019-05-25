# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=sbupdate-git
pkgver=0.r84.aa95459
pkgrel=1
pkgdesc="Generate and sign kernel images for UEFI Secure Boot"
arch=('any')
url="https://github.com/andreyv/sbupdate"
license=('GPL3')
install=sbupdate.install
depends=('bash>=4.4' 'systemd' 'binutils' 'sbsigntools')
makedepends=('git')
backup=('etc/sbupdate.conf')
source=("git+https://github.com/andreyv/sbupdate.git")
sha256sums=('SKIP')

pkgver() {
  cd sbupdate
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd sbupdate

  install -D -m 0755 sbupdate "${pkgdir}/usr/bin/sbupdate"
  install -D -m 0644 sbupdate.hook "${pkgdir}/usr/share/libalpm/hooks/95-sbupdate.hook"
  install -D -m 0644 tmpfiles.d/sbupdate.conf "${pkgdir}/usr/lib/tmpfiles.d/sbupdate.conf"

  install -D -m 0644 sbupdate.conf "${pkgdir}/etc/sbupdate.conf"

  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
