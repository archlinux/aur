# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Manuel Linares <mbarriolinares at gmail dot com>

_pkgname=ristretto
pkgname=$_pkgname-git
pkgver=0.14.0.r15.g19c0832b
pkgrel=1
pkgdesc="A fast and lightweight picture viewer for Xfce (git version)"
arch=('x86_64')
url="https://docs.xfce.org/apps/ristretto/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('exo' 'libxfce4ui' 'xfconf' 'tumbler' 'libexif' 'file')
makedepends=('git' 'glib2-devel' 'meson' 'python' 'xfce4-dev-tools')
provides=('ristretto')
conflicts=('ristretto')

source=("git+https://gitlab.xfce.org/apps/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^ristretto-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build \
    --localstatedir=/var
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
