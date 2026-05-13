# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=pam-fde-boot-pw-git
pkgver=0.r2.g49bf498
pkgrel=1
pkgdesc="PAM module to pass FDE password from kernel keyring to user-space keyrings"
arch=('x86_64')
url="https://git.sr.ht/~kennylevinsen/pam_fde_boot_pw"
license=('MIT')
depends=('pam' 'keyutils')
makedepends=('meson' 'ninja' 'git')
provides=('pam-fde-boot-pw')
conflicts=('pam-fde-boot-pw')
source=("${pkgname}-${pkgver}::git+https://git.sr.ht/~kennylevinsen/pam_fde_boot_pw")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}-${pkgver}"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
