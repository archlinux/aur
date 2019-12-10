# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>
# Author: Ondrej Čerman

_pkgbase=zenmonitor
pkgname=zenmonitor-git
pkgver=35.495045e
pkgrel=1
pkgdesc="Zen monitor is monitoring software for AMD Zen-based CPUs"
arch=('x86_64' 'i686')
url="https://github.com/ocerman/zenmonitor"
license=('GPL')
depends=('zenpower' 'gtk3')
makedepends=('git')
provides=('zenmonitor')

source=("$_pkgbase::git+$url.git"
        "Makefile"
        "zenmonitor.desktop")
sha256sums=("SKIP"
            "b8beb6d450c13207b30b5775dffea9a1ffb56628646d69c4f287152845539167"
            "64889984173a1e0d319dc71f9d5cb96cf8298e6d78c4ff12513374d7b96bbfe4")

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
}

build() {
  cd "$srcdir/$_pkgbase"
  make -f ../Makefile
}

package() {
  install -Dm755 "$srcdir/$_pkgbase"/zenmonitor ${pkgdir}/usr/bin/zenmonitor
  install -Dm644 "$srcdir"/zenmonitor.desktop ${pkgdir}/usr/share/applications/zenmonitor.desktop
}
