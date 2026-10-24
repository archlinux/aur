# Maintainer: Gergely Imreh <gergely at imreh dot net>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=xfce4-artwork
pkgver=0.1.1a_git20110420
_debian_pkgver=0.1.1a~git+20110420
pkgrel=8
pkgdesc="Backdrops for the Xfce4 desktop"
arch=('any')
url="https://goodies.xfce.org/projects/artwork/xfce4-artwork"
# Per Debian's copyright file; README also calls park.jpg an "Original GFDL photo"
license=('GPL-2.0-or-later')
# Upstream is gone, this is the last tarball Debian shipped
source=("https://sources.archlinux.org/other/packages/${pkgname}/${pkgname}_${_debian_pkgver}.orig.tar.gz")
sha256sums=('7a97c0acd0ed67ebb871866cc79c2925bea45bf1b92442bd88fac390dbe639ac')
b2sums=('6e5a005bd8e27804909918dab9a72088742133c3ffdff0d684f4d4a3a7c3d9fb23163c76a4b418d4d1eea190dcca4965b2cdf056ddcdb720733be2b94bf4c6f2')

build() {
  cd "${pkgname}-0.1.1a"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-0.1.1a"
  # xfdesktop looks in backgrounds/xfce, not upstream's xfce4/backdrops
  make DESTDIR="${pkgdir}" backdropsdir=/usr/share/backgrounds/xfce install

  # README is the only place that credits the author of each image
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README AUTHORS ChangeLog
}
