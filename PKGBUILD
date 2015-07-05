# Maintainer: Maximilian Stein <theoddbird@posteo.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-themes-archblue-git
pkgver=2.4.r46.c6fc852
pkgrel=1
pkgdesc='A flat and light theme with a modern look using Arch Linux colors (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('numix-themes-archblue')
conflicts=('numix-themes-archblue')
source=('numix-themes::git+https://github.com/shimmerproject/Numix.git')
md5sums=('SKIP')

pkgver() {
  cd numix-themes

  #printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
  printf "2.4.r%s.%s" "$(git rev-list --count v2.4..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd numix-themes
    # Replace the Numix Pink/Red with Arch Linux Blue,
    # also replace Nero (#2d2d2d) with Montana (#333333)
    #  - https://www.archlinux.org/art/
    for FILE in gtk-2.0/gtkrc \
            gtk-3.0/gtk-dark.css \
            gtk-3.0/gtk-widgets-assets.css \
            gtk-3.0/gtk-widgets.css \
            gtk-3.0/gtk.css \
            gtk-3.0/settings.ini \
            gtk-3.0/apps/gnome-applications.css \
            gtk-3.0/apps/granite-widgets.css \
            gtk-3.0/apps/lightdm-gtk-greeter.css \
            gtk-3.0/apps/nemo.css \
            gtk-3.0/apps/synaptic.css \
            gtk-3.0/apps/unity.css \
            gtk-3.0/apps/xfce.css \
            metacity-1/metacity-theme-2.xml \
            metacity-1/metacity-theme-3.xml \
            openbox-3/themerc \
            xfce-notify-4.0/gtkrc \
            xfwm4/themerc \
            index.theme
    do
        sed -i 's/#fc6f5d/#1793d1/g' "${FILE}"
        sed -i 's/#d64937/#1793d1/g' "${FILE}"
        sed -i 's/#2d2d2d/#333333/g' "${FILE}"
        sed -i 's/Numix/Numix-ArchBlue/' "${FILE}"
    done
}

package() {
  cd numix-themes
  install -dm 755 "${pkgdir}"/usr/share/themes/Numix-ArchBlue
  rm -rf .git .gitignore CREDITS LICENSE README.md
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix-ArchBlue/
}

# vim: ts=2 sw=2 et:
