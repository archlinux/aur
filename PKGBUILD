_pkgbase=arc-kde
pkgbase=${_pkgbase}-git
pkgver=20161201
pkgrel=1
pkgdesc='Arc customization for Plasma 5 (git version)'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/arc-kde'
license=('GPLv3')
options=('!strip')
makedepends=('git')
optdepends=(
  "gtk-theme-arc-git: A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell (git version)"
  "arc-firefox-theme-git: Arc Firefox theme (git version)"
)
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${pkgbase}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

_package-plasma-theme-git () {
  pkgdesc="Arc plasma theme (git version)"
  depends=('plasma-desktop')
  install=${pkgname}.install

  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r plasma ${pkgdir}/usr/share
}

_package-aurorae-theme-git () {
  pkgdesc="Arc decorations for Kwin (git version)"
  depends=('kwin')

  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r aurorae ${pkgdir}/usr/share
}

_package-kvantum-theme-git () {
  pkgdesc="Arc theme for Kvantum theme engine (git version)"
  depends=(qt{4,5}-style-kvantum-svn kvantum-tools-qt5-svn)

  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r Kvantum ${pkgdir}/usr/share
}

_package-color-schemes-git () {
  pkgdesc="Arc color scheme for KDE (git version)"
  depends=('plasma-desktop')

  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r color-schemes ${pkgdir}/usr/share
}

_package-konsole-colorscheme-git () {
  pkgdesc="Arc color scheme for Konsole (git version)"
  depends=('konsole')

  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r konsole ${pkgdir}/usr/share
}

_package-konversation-theme-git () {
  pkgdesc="Arc color scheme for Konversation (git version)"
  depends=('konversation')

  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r konversation ${pkgdir}/usr/share
}

_package-yakuake-theme-git () {
  pkgdesc="Arc color scheme for Yakuake (git version)"
  depends=('yakuake')

  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r yakuake ${pkgdir}/usr/share
  mv ${pkgdir}/usr/share/yakuake/{kns_skins,skins}
}

_package-wallpapers-git () {
  pkgdesc="Arc Wallpapers Suite (git version)"
  depends=('plasma-desktop')

  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r wallpapers ${pkgdir}/usr/share
}

pkgname=(
  "${_pkgbase}-plasma-theme-git"
  "${_pkgbase}-aurorae-theme-git"
  "${_pkgbase}-kvantum-theme-git"
  "${_pkgbase}-color-schemes-git"
  "${_pkgbase}-konsole-colorscheme-git"
  "${_pkgbase}-konversation-theme-git"
  "${_pkgbase}-yakuake-theme-git"
  "${_pkgbase}-wallpapers-git"
)
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${_pkgbase}}")
    _package${_p#${_pkgbase}}
  }"
done
