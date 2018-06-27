# Maintainer: Bas Ammerlaan <steelbas@gmail.com>

_pkgname=acyls-icon-theme
pkgname=${_pkgname}-git
pkgver=412.01a7ae3
pkgrel=1
pkgdesc='Any Color You Like Simple icon pack'
arch=('any')
url='https://github.com/worron/ACYLS'
license=('GPL')
depends=('gtk-update-icon-cache')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
options=('!strip')
source=('git+https://github.com/worron/ACYLS.git')
sha256sums=('SKIP')
install=${_pkgname}.install

pkgver() {
  cd ${srcdir}/ACYLS
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  install -dm 755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve='ownership' ACYLS "$pkgdir"/usr/share/icons/


#		Make the GUI program starting script refer to /usr/share/icons instead of ~/.icons:	

#    sed 's:~/.icons:/usr/share/icons:' "$pkgdir"/usr/share/icons/ACYLS/desktop/acyls.desktop > "$pkgdir"/usr/share/icons/ACYLS/desktop/acyls.desktop_tmp
#    mv "$pkgdir"/usr/share/icons/ACYLS/desktop/acyls.desktop_tmp "$pkgdir"/usr/share/icons/ACYLS/desktop/acyls.desktop

#		Copy .desktop file
#	mkdir "$pkgdir"/usr/share/applications/
#    cp --no-preserve='ownership' "$pkgdir"/usr/share/icons/ACYLS/desktop/acyls.desktop "$pkgdir"/usr/share/applications/

#		Fix permissions

    find "${pkgdir}"/usr/share/icons/ -type d -exec chmod 755 {} \;
    find "${pkgdir}"/usr/share/icons/ -type f -exec chmod 644 {} \;
  
    
}
