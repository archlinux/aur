# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>

pkgname=clearlooks-phenix-gtk-theme-git
pkgver=6.0.3.r389
pkgrel=2
pkgdesc="Clearlooks-Phénix project aims at creating a GTK3 port of Clearlooks"
arch=('any')
url="https://github.com/jpfleury/clearlooks-phenix"
license=('LGPL' 'GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
optdepends=('mist-icon-theme: The original clearlooks icon theme'
	    'lib32-gtk-engine-murrine: Required for 32-bit apps in 64-bit environments')
provides=('clearlooks-phenix-gtk-theme')
conflicts=('clearlooks-phenix-gtk-theme')
options=('!strip')
source=('Clearlooks-Phenix::git+https://github.com/jpfleury/clearlooks-phenix.git')
md5sums=('SKIP')

pkgver() {
  cd "Clearlooks-Phenix"
  echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

package() {
  cd "${srcdir}/Clearlooks-Phenix"

  # create theme dirs
  install -d -m 755 "${pkgdir}/usr/share/themes/Clearlooks-Phenix"
  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/"

  # install theme
  cp -r . "${pkgdir}/usr/share/themes/Clearlooks-Phenix/"
  mv "${pkgdir}/usr/share/themes/Clearlooks-Phenix/"{README.md,LISEZ-MOI.md} "${pkgdir}/usr/share/doc/${pkgname}/"

  # clean up
  cd "${pkgdir}/usr/share/themes/Clearlooks-Phenix/"
  rm -rf {.git,.gitignore,COPYING}
}
