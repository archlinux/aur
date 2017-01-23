# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=lxdm-themes
pkgver=1
pkgrel=6
pkgdesc="Archlinux, ArchlinuxFull, ArchlinuxTop, Arch-Dark, Arch-Stripes and IndustrialArch lxdm themes"
arch=(any)
url="https://wiki.archlinux.org/index.php/LXDM#Themes"
license=('GPL' 'CCPL')
depends=('lxdm')
conflicts=('archlinux-lxdm-theme' 'archlinux-lxdm-theme-full'
           'archlinux-lxdm-theme-top' 'industrial-arch-lxdm')
install=lxdm-themes.install
source=('http://allanmcrae.com/files/lxdm-theme.tar.gz'                   # Archlinux
        'archlinux.patch'
        'git://github.com/redtide/lxdm-theme-archlinux.git'               # ArchlinuxFull
        'http://xdsl.hi2.ro/work/archlinux-lxdm.tar.gz'                   # ArchlinuxTop
        'git+https://github.com/M4rQu1Nh0S/industrial-arch.git'           # IndustrialArch
        'https://www.dropbox.com/s/a8inrdfys3a71c1/lxdm-themes.tar.gz?dl=1' # Arch-Dark, Arch-Stripes
        )
noextract=('lxdm-theme.tar.gz' 'archlinux-lxdm.tar.gz')
sha256sums=('1eeaee69da8dd0ab28fc6967b06d4594980808bed83e822858a31b46926acbe7'
            '1acd676a57525ca3cc6bc194dd5b7f2e942742016d8209ae4b76365bb440b734'
            'SKIP'
            'ad98f832de33909f321e87b10e0af2da156b91e0abf4b7e877e506dbed2fdd6e'
            'SKIP'
            '2fa343b164b4ee6b1891bbf2eb52fc6605ee673323893b443fba32b46949f647')

prepare() {
  # avoid file conflicts by extracting themes in different directories
  cd "$srcdir"
  mkdir Archlinux ArchlinuxTop
  bsdtar -xf lxdm-theme.tar.gz -C Archlinux
  bsdtar -xf archlinux-lxdm.tar.gz -C ArchlinuxTop
  patch -Np0 -i archlinux.patch
}

package() {
  themesdir="${pkgdir}/usr/share/lxdm/themes"
  mkdir -p "${themesdir}/ArchlinuxFull"
  mkdir -p "${themesdir}/Arch-Dark"
  mkdir -p "${themesdir}/Arch-Stripes"
  mkdir -p "${themesdir}/IndustrialArch"

  cd "$srcdir"
  cp -r Archlinux "$themesdir"
  cp -r lxdm-theme-archlinux/Archlinux/* "${themesdir}/ArchlinuxFull"
  cp -r ArchlinuxTop "$themesdir"
  cp -a lxdm-themes/ArchDark/* "${themesdir}/Arch-Dark"
  cp -a lxdm-themes/ArchStripes/* "${themesdir}/Arch-Stripes"
  cp -a industrial-arch/* "${themesdir}/IndustrialArch"
}
