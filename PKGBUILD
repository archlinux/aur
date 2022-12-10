# Maintainer: Paul Stemmet <aur@luxolus.com>

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

pkgname='kdnotify-git'
pkgdesc='A keepalived FIFO notification handler'
pkgver=1.0.3
pkgrel=1
arch=('any')
license=('MPL2')
url='https://git.st8l.com/luxolus/kdnotify'
_artifact="${pkgname}-${pkgver}-${pkgrel}"
_commit='4267651ba9cef57f20fb593d60ca47743efbc06c'
source=("${_artifact}.tar.gz::https://git.st8l.com/luxolus/kdnotify/archive/v${pkgver}.tar.gz")
sha512sums=('2b99e3b2b4dbb250718e5c6649b8182dcf3b82df87efc7cb32fae116b6965387d7f021751c0781313802fe4ee4263f7bb71d4095d913a86998a499dc53f17824')
makedepends=('glibc' 'go')
depends=('glibc')
provides=("kdnotify=${pkgver}")

prepare() {
  cd "${srcdir}/kdnotify"

  make configure Version=${pkgver} Commit=${_commit}
}

check() {
  cd "${srcdir}/kdnotify"

  make check Version=${pkgver} Commit=${_commit}
}

package() {
  cd "${srcdir}/kdnotify"

  install -D -m 644 -o 0 -g 0 'doc/example.watch.yaml' \
    "${pkgdir}/etc/kdnotify/config.yaml"

  make install Prefix=${pkgdir}/usr/bin
}
