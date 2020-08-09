# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=lxdm-themes
pkgver=1
pkgrel=9
pkgdesc="Archlinux, ArchlinuxFull, ArchlinuxTop, Arch-Dark, Arch-Stripes and IndustrialArch lxdm themes"
arch=(any)
url="https://wiki.archlinux.org/index.php/LXDM#Themes"
license=('GPL' 'CCPL')
makedepends=('git')
conflicts=('archlinux-lxdm-theme' 'archlinux-lxdm-theme-full'
           'archlinux-lxdm-theme-top' 'industrial-arch-lxdm')
install=lxdm-themes.install
source=('http://allanmcrae.com/files/lxdm-theme.tar.gz'                   # Archlinux
        'archlinux.patch'
        'git+https://github.com/redtide/lxdm-theme-archlinux.git'         # ArchlinuxFull
        'git+https://github.com/M4rQu1Nh0S/industrial-arch.git'           # IndustrialArch
        'https://www.dropbox.com/s/a8inrdfys3a71c1/lxdm-themes.tar.gz'    # Arch-Dark, Arch-Stripes, ArchLinuxTop
        )
noextract=('lxdm-theme.tar.gz' 'archlinux-lxdm.tar.gz')
sha256sums=('1eeaee69da8dd0ab28fc6967b06d4594980808bed83e822858a31b46926acbe7'
            '1acd676a57525ca3cc6bc194dd5b7f2e942742016d8209ae4b76365bb440b734'
            'SKIP'
            'SKIP'
            'fef08756cb307766ffdf8ef69aa64e3f5c9ceaa88c3c2ce881c9f29498aa24a6')

prepare() {
  # avoid file conflicts by extracting themes in different directories
  cd "$srcdir"
  mkdir Archlinux
  bsdtar -xf lxdm-theme.tar.gz -C Archlinux
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
  cp -r lxdm-themes/ArchlinuxTop "$themesdir"
  cp -a lxdm-themes/ArchDark/* "${themesdir}/Arch-Dark"
  cp -a lxdm-themes/ArchStripes/* "${themesdir}/Arch-Stripes"
  cp -a industrial-arch/* "${themesdir}/IndustrialArch"
}
