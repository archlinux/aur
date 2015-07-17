# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=gnome-shell-extension-freon-git
pkgver=1.3.r120.g12ecebd
pkgrel=2
pkgdesc="Displays: CPU temperature, HDD/SSD temperature, video card temperature (nVidia/Catalyst), voltage and fan RPM in GNOME Shell."
arch=('any')
url="https://github.com/UshakovVasilii/gnome-shell-extension-freon"
license=('GPL')
depends=('dconf' 'gnome-shell')
makedepends=('git' 'gnome-common' 'intltool')
provides=('gnome-shell-extension-freon')
conflicts=('gnome-shell-extensions-git' 'gnome-shell-extensions-freon')
install="gschemas.install"
source=("${pkgname}::git+https://github.com/UshakovVasilii/gnome-shell-extension-freon.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  _branch=master
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch}
  sed -i 's#\[\"3.12\", \"3.14\"\]#\[\"3.12\", \"3.14\", \"3.16\"\]#g' "./freon@UshakovVasilii_Github.yahoo.com/metadata.json"
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -r freon@UshakovVasilii_Github.yahoo.com "${pkgdir}/usr/share/gnome-shell/extensions/"
}
