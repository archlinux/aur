# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

_with_extra=y

pkgname=arc-kde-git
epoch=1
pkgver=r112.0d4ff0e
pkgrel=4
pkgdesc='A port of the popular GTK theme Arc for Plasma 5 desktop with a few additions and extras (git version)'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/arc-kde'
license=('GPLv3')
options=('!strip')
conflicts=('arc-kde')
provides=('arc-kde')
makedepends=('git')
optdepends=(
  "plasma-desktop: For Plasma desktop theme"
  "arc-gtk-theme: A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
  "arc-firefox-theme: Arc Firefox theme"
  "kwin: For Aurorae decorations"
  "kvantum-qt5: For Kvantum Theme"
  "konsole: For Konsole color schemes"
  "konversation: For konversation theme"
  "yakuake: For Yakuake theme"
)

if [ -n "${_with_extra}" ]; then
    optdepends+=("eclipse-common")
    
    prepare() {
        sed -i 's|^install:|install:\n\tmkdir -p $(DESTDIR)/usr/share/arc\n\tcp --no-preserve=mode,ownership -r extra $(DESTDIR)/usr/share/arc|' "${srcdir}/${pkgname}/Makefile"
    }
fi

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
