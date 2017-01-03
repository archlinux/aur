# Maintainer: Samim Pezeshki (psamim) <psamim@gmail.com>

_pkgname=an2linuxserver
pkgname=an2linuxserver-git
pkgver=r2.32c9bb8
pkgrel=1
pkgdesc='Make Persian EPUBs compatible to E-Readers such as Kindle'
url='https://github.com/rootkiwi/an2linuxserver/'
license=('GPL3')
source=('git+https://github.com/rootkiwi/an2linuxserver.git')
sha256sums=('SKIP')
arch=('any')
depends=('python' 'libnotify' 'python-gobject' 'openssl')
makedepends=('git')
conflicts=('an2linuxserver')
provides=('an2linuxserver')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/an2linuxserver.py" "${pkgdir}/usr/bin/an2linuxserver.py"
}
