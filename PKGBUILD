# Maintainer: linkfrg <linkfrg.dev@proton.me>
pkgname=python-ignis-git
_pkgname=ignis
pkgver=0.5.r123.g2cf7e62
pkgrel=1
pkgdesc="A widget framework for building desktop shells, written and configurable in Python"
arch=('x86_64')
url="https://github.com/ignis-sh/ignis"
license=('LGPL-2.1-or-later')
makedepends=(python-hatchling
             python-hatch-vcs
             python-build
             python-installer
             python-wheel)
depends=(python
         glib2
         gtk4
         gtk4-layer-shell
         python-cairo
         python-gobject
         python-click
         python-loguru
         python-rich)
optdepends=('gpu-screen-recorder: required for Recorder Service'
            'networkmanager: required for Network Service'
            'dart-sass: SASS/SCSS compilation support'
            'upower: required for UPower Service'
            'gnome-bluetooth-3.0: required for Bluetooth Service'
            'ignis-gvc-git: required for Audio Service')

provides=('python-ignis' 'ignis' 'ignis-git')
conflicts=('python-ignis' 'ignis' 'ignis-git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
