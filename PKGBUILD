# Maintainer: Julian Hornich <vivaeltopo@googlemail.com>

pkgname=gnome-shell-theme-viva-git
_pkgver=3.36.0
pkgver=3.36.0.155.556af43
pkgrel=1
pkgdesc="A custom gnome-shell theme named viva (blue and orange version)"
arch=('any')
url="https://github.com/vivaeltopo/gnome-shell-theme-viva"
groups=('gnome-shell-extensions')
license=('GPL3')
depends=('gnome-shell>=3.36' 'adobe-source-sans-pro-fonts' 'ttf-impallari-raleway-family')
makedepends=('sassc')
source=('git+https://github.com/vivaeltopo/gnome-shell-theme-viva.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/gnome-shell-theme-viva
  echo ${_pkgver}.$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  # orange version
  cd $srcdir/gnome-shell-theme-viva
  make orange
	make

  mkdir -p ${pkgdir}/usr/share/themes/viva-orange
  cp -r gnome-shell ${pkgdir}/usr/share/themes/viva-orange/
  chmod -R 755 ${pkgdir}/usr/share/themes/viva-orange

  # cleanup
  cd ${pkgdir}/usr/share/themes/viva-orange/gnome-shell/
  rm -rf gnome-classic.css *.scss styles

  # blue version
  cd $srcdir/gnome-shell-theme-viva
  make blue
	make

  mkdir -p ${pkgdir}/usr/share/themes/viva-blue
  cp -r gnome-shell ${pkgdir}/usr/share/themes/viva-blue/
  chmod -R 755 ${pkgdir}/usr/share/themes/viva-blue

  # cleanup
  cd ${pkgdir}/usr/share/themes/viva-blue/gnome-shell/
  rm -rf gnome-classic.css *.scss styles
}
