# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=kde-colors-solarized-git
pkgver=20131024
pkgrel=1
pkgdesc="Solarized Dark and Solarized Light themes for Konsole, Kate and Kcolorchooser."
arch=('any')
url="https://github.com/hayalci/kde-colors-solarized"
license=('GPL')
makedepends=('git')
depends=('kdebase-workspace')
_gitroot=https://github.com/hayalci/kde-colors-solarized.git

build() {
  if [[ ! -d "$pkgname" ]] ; then
    git clone "$_gitroot" "$pkgname"
  fi
  cd "$pkgname"
  git reset --hard
  git checkout "$_gitname"
  git pull
}

package() {
  # We reproduce the steps from the install script
  prefix=$(kde4-config --prefix)/share

  # KDE Color Palette
  mkdir -p ${pkgdir}/${prefix}/config/colors/
  install -m 644 ${srcdir}/${pkgname}/Solarized_Colors ${pkgdir}/${prefix}/config/colors/Solarized\ Colors

  # Konsole (yakuake, etc.) color scheme
  mkdir -p ${pkgdir}/${prefix}/apps/konsole/
  install -m 644 ${srcdir}/${pkgname}/"Solarized Dark.colorscheme"  ${pkgdir}/${prefix}/apps/konsole
  install -m 644 ${srcdir}/${pkgname}/"Solarized Light.colorscheme" ${pkgdir}/${prefix}/apps/konsole

  # Kate Color Schema and syntax highligting / merged upstream
  # mkdir -p ${pkgdir}/${prefix}/config/
  # cat ${srcdir}/${pkgname}/"Solarized Dark.kateschema" >   ${pkgdir}/${prefix}/config/kateschemarc
  # cat ${srcdir}/${pkgname}/"Solarized Dark.katesyntax" >   ${pkgdir}/${prefix}/config/katesyntaxhighlightingrc
  # cat ${srcdir}/${pkgname}/"Solarized Light.kateschema" >> ${pkgdir}/${prefix}/config/kateschemarc
  # cat ${srcdir}/${pkgname}/"Solarized Light.katesyntax" >> ${pkgdir}/${prefix}/config/katesyntaxhighlightingrc

}

# vim:set ts=2 sw=2 et:
