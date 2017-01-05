# Maintainer: Samim Pezeshki (psamim) <psamim@gmail.com>

_pkgname=an2linuxserver
pkgname=an2linuxserver-git
pkgver=r6.4c03e19
pkgrel=1
pkgdesc='Sync android notifications encrypted to a linux desktop with tcp or bluetooth'
url='https://github.com/rootkiwi/an2linuxserver/'
license=('GPL3')
source=('git+https://github.com/rootkiwi/an2linuxserver.git'
        'an2linuxserver.service')
sha256sums=('SKIP'
            'bbde8724bd49be3f5f7ae38f283aec409ab81347c486f1b484a1e2c0c8026b09')
arch=('any')
depends=('python'
         'libnotify'
         'python-gobject'
         'openssl')
optdepends=('python-pybluez: bluetooth support ')
makedepends=('git')
conflicts=('an2linuxserver')
provides=('an2linuxserver')
install=$pkgname.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/an2linuxserver.py" "${pkgdir}/usr/bin/an2linuxserver.py"
  install -Dm644 an2linuxserver.service ${pkgdir}/usr/lib/systemd/user/an2linuxserver.service
}
