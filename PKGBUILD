# Maintainer: envolution
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Jan Magnus Brevik <janmbrevik@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gpodder-git
pkgver=3.11.5+r5422+g72db9971f
pkgrel=1
pkgdesc='A podcast receiver/catcher'
license=('GPL-3.0-or-later')
arch=('any')
url='http://gpodder.github.io/'
depends=(gtk3 python-cairo dbus-python python-gobject python-mygpoclient python-podcastparser python-requests)
makedepends=(git intltool python-build python-installer python-setuptools)
optdepends=('youtube-dl: for Youtube-dl extension')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}::git+https://github.com/gpodder/gpodder.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  _version=$(git describe --tags --abbrev=0 | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cd "${pkgname}"
  make messages
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
