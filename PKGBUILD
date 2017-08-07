# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

_with_extra=y

pkgname=arc-kde-git
epoch=1
pkgver=r11.5485068
pkgrel=1
pkgdesc='Arc customization mainly for Plasma 5 (git version)'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/arc-kde'
license=('GPLv3')
options=('!strip')
conflicts=('arc-kde')
provides=('arc-kde')
makedepends=('git')
optdepends=(
  "plasma-desktop: For Plasma desktop theme"
  "gtk-theme-arc-git: A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell (git version)"
  "arc-firefox-theme-git: Arc Firefox theme (git version)"
  "kwin: For Aurorae decorations"
  "kvantum-qt5: For Kvantum Theme"
  "konsole: For Konsole color schemes"
  "konversation: For konversation theme"
  "yakuake: For Yakuake theme"
)

if [ -n "${_with_extra}" ]; then
    optdepends+=(
        "telegram-desktop"
        "eclipse-common"
        "firefox"
    )
    
    prepare() {
        if [ -n "${_with_extra}" ]; then
            sed -i 's|^install:|install:\n\tmkdir -p $(DESTDIR)/usr/share/arc\n\tcp --no-preserve=mode,ownership -r extra $(DESTDIR)/usr/share/arc|' "${srcdir}/${pkgname}/Makefile"
        fi
    }
fi

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
