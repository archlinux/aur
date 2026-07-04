# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=cronopete-bin
pkgver=4.21.0
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
sha256sums=('6520a6e0366c3a203a1975785035dc6d20f195c8d48f4c55bf0f5d9a9813df6d')

latestver() {
  curl -fsSL "${url}" |
    grep -oP 'cronopete-\K[0-9]+(\.[0-9]+)*(?=-1-x86_64\.pkg\.tar\.zst)' |
    sort -V | tail -1
}

package() {
  bsdtar -xf "${srcdir}/cronopete-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}"

  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
