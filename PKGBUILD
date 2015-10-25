# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ryan Young <ry an. ry. young@gmail.com> (omit spaces)

pkgname=temp-throttle-git
pkgver=r37.4199e7e
pkgrel=1
pkgdesc="A shell script for throttling system CPU frequency based on a desired maximum temperature."
arch=('any')
url="https://github.com/Sepero/temp-throttle"
license=('GPL2')
depends=('bash')
makedepends=('git')
source=('git://github.com/Sepero/temp-throttle.git'
        'temp-throttle@.service')
sha256sums=('SKIP'
            '18ae3edd7b41508da279df6d67f1c5d86e1dbfe2daebbc42bbe39c26031b22e0')

pkgver() {
  cd "${pkgname%-git}"
  printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 'temp_throttle.sh' "${pkgdir}/usr/bin/${pkgname%-git}"
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${pkgname%-git}@.service"
}

