# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=sbupdate-git
pkgver=0.r64.f3d610b
pkgrel=1
pkgdesc="Generate and sign kernel images for UEFI Secure Boot"
arch=('any')
url="https://github.com/andreyv/sbupdate"
license=('GPL3')
depends=('bash>=4.4' 'systemd' 'binutils' 'sbsigntools')
makedepends=('git')
backup=('etc/default/sbupdate')
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

  install -D -m 0644 default "${pkgdir}/etc/default/sbupdate"

  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
