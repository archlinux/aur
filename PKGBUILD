# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=lxdm-themes
pkgver=1
pkgrel=3
pkgdesc="Archlinux, ArchlinuxFull, ArchlinuxTop, Arch-Dark, Arch-Stripes and IndustrialArch lxdm themes"
arch=(any)
url="https://wiki.archlinux.org/index.php/LXDM#Themes"
license=('GPL' 'CCPL')
depends=('lxdm')
conflicts=('archlinux-lxdm-theme' 'archlinux-lxdm-theme-full'
           'archlinux-lxdm-theme-top' 'industrial-arch-lxdm')
install=lxdm-themes.install
source=('http://allanmcrae.com/files/lxdm-theme.tar.gz'                   # Archlinux
        'greeter.ui.ArchlinuxFull'                                        # ArchlinuxFull
        'http://xdsl.hi2.ro/work/archlinux-lxdm.tar.gz'                   # ArchlinuxTop
        'git+https://github.com/M4rQu1Nh0S/industrial-arch.git'           # IndustrialArch
        #'http://dl.dropbox.com/u/4813005/lxdm/lxdm-themes.tar.gz'        # old dropbox link for Arch-Dark, Arch-Stripes
        'https://dl.dropboxusercontent.com/u/33870708/lxdm-themes.tar.gz' # Arch-Dark, Arch-Stripes
        )
noextract=('lxdm-theme.tar.gz' 'archlinux-lxdm.tar.gz')
sha256sums=('1eeaee69da8dd0ab28fc6967b06d4594980808bed83e822858a31b46926acbe7'
            '09c66ccc6de32c6685b4f27cbfd2f2a2a679d4e961eebcbc80c294eb8d0f47d3'
            'ad98f832de33909f321e87b10e0af2da156b91e0abf4b7e877e506dbed2fdd6e'
            'SKIP'
            '2e6ad13c483559e3778f81ba4cf3b88b96034f5b38877ac3dad85b9b16def6e3')

prepare() {
  # avoid file conflicts by extracting themes in different dirs
  cd "$srcdir"
  mkdir Archlinux ArchlinuxTop
  bsdtar -xf lxdm-theme.tar.gz -C Archlinux
  bsdtar -xf archlinux-lxdm.tar.gz -C ArchlinuxTop
}

package() {
  themesdir="${pkgdir}/usr/share/lxdm/themes"
  mkdir -p "${themesdir}/ArchlinuxFull"
  mkdir -p "${themesdir}/Arch-Dark"
  mkdir -p "${themesdir}/Arch-Stripes"
  mkdir -p "${themesdir}/IndustrialArch"

  cd "$srcdir"
  cp -r Archlinux "$themesdir"
  cp -a Archlinux/* "${themesdir}/ArchlinuxFull"
  cp greeter.ui.ArchlinuxFull "${themesdir}/ArchlinuxFull"
  cp -r ArchlinuxTop "$themesdir"
  cp -a lxdm-themes/ArchDark/* "${themesdir}/Arch-Dark"
  cp -a lxdm-themes/ArchStripes/* "${themesdir}/Arch-Stripes"
  cp -a industrial-arch/* "${themesdir}/IndustrialArch"
}
