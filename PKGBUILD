# Maintainer: Paul Stemmet <aur@luxolus.com>

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

pkgname='kdnotify-git'
pkgdesc='A keepalived FIFO notification handler'
pkgver=1.0.6
pkgrel=2
arch=('any')
license=('MPL2')
url='https://git.st8l.com/luxolus/kdnotify'
_artifact="${pkgname}-${pkgver}-${pkgrel}"
_commit='d428ff7086a98fcb0592babe8aa36857be824b5a'
source=("${_artifact}.tar.gz::https://git.st8l.com/luxolus/kdnotify/archive/v${pkgver}.tar.gz")
sha512sums=('f15d78b06c19a505230d7be1677aebd7a96f766fa9f3bc68f93e4d3d5296395254e84b82ee31bdc5c0c79e0f9ece81ad2e715f06d42a3f53c7239ff9ec50bf2b')
makedepends=('glibc' 'go')
depends=('glibc')
provides=("kdnotify=${pkgver}")
backup=('etc/kdnotify/config.yaml')

prepare() {
  cd "${srcdir}/kdnotify"

  make configure \
    Version=${pkgver} \
    Commit=${_commit} \
    Prefix=${pkgdir}/usr/bin \
    Systemd=${pkgdir}/usr/lib/systemd
}

build() {
  cd "${srcdir}/kdnotify"

  make build
}

check() {
  cd "${srcdir}/kdnotify"

  make check
}

package() {
  cd "${srcdir}/kdnotify"

  make install

  install -D -m 644 -o 0 -g 0 'doc/example.watch.yaml' \
    "${pkgdir}/etc/kdnotify/config.yaml"
}
