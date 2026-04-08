# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=cronopete-bin
pkgver=4.19.1
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('x86_64')
url="https://www.rastersoft.com/programas/cronopete.html"
license=('GPL-3.0-or-later')
provides=('cronopete')
conflicts=('cronopete')
# rsync and udisks2 are core runtime requirements, not optional extras.
# gcc-libs is kept intentionally because the upstream binary links libgcc_s/libstdc++.
depends=('dconf' 'gcc-libs' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libgee' 'libnotify' 'rsync' 'udisks2')
options=('!strip' '!debug')
source=("cronopete-${pkgver}-1-x86_64.pkg.tar.zst::https://www.rastersoft.com/descargas/cronopete/cronopete-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('0d0f5dfab1e49f3cc8da7c69e9529d85d61a867eff940d372c7f55315a2ee70c')

latestver() {
  curl -fsSL "${url}" |
    perl -0ne 'print "$1\n" if /Current version:\s*([0-9]+(?:\.[0-9]+)*)/s' |
    sed -n '1p'
}

package() {
  bsdtar -xf "${srcdir}/cronopete-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}"

  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
