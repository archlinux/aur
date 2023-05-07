_pkgbase="redmond97"
pkgname="${_pkgbase}-gtk-theme-git"
pkgver=r75.f33bc05
pkgrel=1
pkgdesc="A Win9x inspired GTK2/GTK3 theme developed for XFCE4"
arch=(any)
url="https://github.com/matthewmx86/Redmond97"
license=('GPL3')
depends=(gtk3)
makedepends=(git)
optdepends=(ttf-ms-fonts)
conflicts=("${_pkgbase}-gtk-theme")
source=("git+https://github.com/matthewmx86/Redmond97.git")
sha512sums=(SKIP)

pkgver() {
  cd "Redmond97"
  
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
    cd Redmond97/Theme

    _saveifs=$IFS
    IFS=$(echo -en "\n\b")

    install -d "${pkgdir}/usr/share"
    cp -r "csd/" "${pkgdir}/usr/share/themes/"
    
    for _theme in $(ls "${pkgdir}/usr/share/themes"); do
        chmod -R 755 "${pkgdir}/usr/share/themes/${_theme}"
    done

    IFS=$_saveifs
}
