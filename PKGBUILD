# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ryan Young <ry an. ry. young@gmail.com> (omit spaces)

pkgname=temp-throttle-git
pkgver=r131.e26baae
pkgrel=1
pkgdesc="A shell script for throttling system CPU frequency based on a desired maximum temperature."
arch=('any')
url="https://github.com/Sepero/temp-throttle"
license=('GPL-2.0-only')
depends=('bash')
makedepends=('git')
conflicts=("temp-throttle")
backup=("etc/temp-throttle.conf")
source=("git+https://github.com/Sepero/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  # Install executable
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "usr/sbin/${pkgname%-git}"
  # Install configuration file
  install -m 755 -d "${pkgdir}/etc"
  install -m 755 -t "${pkgdir}/etc" "etc/${pkgname%-git}.conf"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${pkgname%-git}/README"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${pkgname%-git}/credits.txt"
  # Install systemd service
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" "usr/lib/systemd/system/${pkgname%-git}.service"
}

