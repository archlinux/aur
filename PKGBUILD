# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=eclipse-jee-bin
pkgver=4.20
_pkgver=2021-06
pkgrel=1
pkgdesc='Highly extensible IDE'
arch=('x86_64')
url='https://www.eclipse.org'
license=(EPL)
provides=(
  'eclipse-jee'
  'eclipse-java'
)
conflicts=(
  'eclipse-jee'
  'eclipse-java'
  'eclipse-cpp'
)
depends=(
  'java-environment>=11'
  'polkit'
)
makedepends=(
  'imagemagick'
)
source=(
  "eclipse-jee-${_pkgver}-R-linux-gtk-x86_64.tar.gz::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${_pkgver}/R/eclipse-jee-${_pkgver}-R-linux-gtk-x86_64.tar.gz&r=1"                                     
  'eclipse.desktop'
  'eclipse-root.desktop'
  'eclipse.policy'
)
sha512sums=(
  '89b8d359e7a0e5891b4adce63b464a84520c7aff7fde8f47689b2414dc7fdb1247d74f8651986d7fe8699561368c10133c9633b0d39fc7cc76b6206d574eb4cb'
  '105f797bbcd7465b87ea0b43f3a243fa1c49e6b6ce26cde51c2e651b217ea596d4317456e5718efeff500a1eed7223e2a01f5b41769a1cf66233d5dd36e9b988'
  '3a7ce30eac368d3edc73f0525ae212fc174da3a53db456839ca2747aaa250e0029617e9e3e493a9b90abd6746345bced7b68ee4a1d553bad743f80f264a71b92'
  'ddeb688a077bba915333270934a13bdb0720b07b0d36cf0d39fdc33648c1c80cc41a5bab8ae97b58317cbf03b49c02f256d04dfb43fefe3eaaa43eaaa4e3276d'
)
_pkgname="${pkgname/-git/}"
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>$_stop "


package() {
  echo -e "${_prefix}Creating the package base"
  install -d "$pkgdir"/{opt,usr/bin,usr/share/pixmaps}

  echo -e "${_prefix}Copying the package files"
  cp -r eclipse -t "$pkgdir"/opt

  echo -e "${_prefix}Setting up /usr/bin launchers"
  ln -s /opt/eclipse/eclipse "$pkgdir"/usr/bin/eclipse

  echo -e "${_prefix}Setting up desktop shortcuts"
  install -Dm 644 ../eclipse.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 ../eclipse-root.desktop -t "$pkgdir"/usr/share/applications

  echo -e "${_prefix}Setting up desktop icon"
  convert eclipse/icon.xpm "$pkgdir"/usr/share/pixmaps/eclipse.png

  echo -e "${_prefix}Setting up policy file for the \"run as root\" desktop shortcut, recommended launcher for updating Eclipse and installing plugins"
  install -Dm 644 ../eclipse.policy -t "$pkgdir"/usr/share/polkit-1/actions
}
