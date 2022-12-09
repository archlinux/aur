# Maintainer: Paul Stemmet <aur@luxolus.com>

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

pkgname='kdnotify-git'
pkgdesc='A keepalived FIFO notification handler'
pkgver=1.0.2
pkgrel=1
arch=('any')
license=('MPL2')
url='https://git.st8l.com/luxolus/kdnotify'
_artifact="${pkgname}-${pkgver}-${pkgrel}"
_commit='fdc681e8e75c4d52305bf848e9387f7af154e5b6'
source=("${_artifact}.tar.gz::https://git.st8l.com/luxolus/kdnotify/archive/v${pkgver}.tar.gz")
sha512sums=('06ef30116c865899578679b10234cb1f20bb54729b2bda52ab3a127dce2563b3da1d993f9be816499b3ac08737fc92b7fefe377998eab6367385d5d95ec681fb')
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

  make install Prefix=${pkgdir}/usr/bin
}
