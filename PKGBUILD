# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=DesQArchiver
pkgname=desq-apps-archiver
pkgver=0.0.9
pkgrel=1
pkgdesc="A simple file archiver for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQApps/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'libarchive-qt-qt6'
        'libdesqui'
        'dfl-applications'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQApps/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('0a0e081a53d61ce951495fd9d98923184feadc8acecd6e185e876c660ee5d662')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

