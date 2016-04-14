# Maintainer: Nikita Sivakov <cryptomaniac.512@gmail.com>
# Contributor: Nikita Sivakov <cryptomaniac.512@gmail.com>

pkgname=numix-themes-archblue-git
pkgver=2.5.1.r193.a86f0a3
pkgrel=2
pkgdesc='A flat and light theme with a modern look using Arch Linux colors (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git' 'ruby-sass')
provides=('numix-themes-archblue')
conflicts=('numix-themes-archblue')
source=("git+https://github.com/shimmerproject/Numix.git")
md5sums=('SKIP')

pkgver() {
  cd Numix
  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

prepare() {
    cd Numix

    for FILE in `find -type f`
    do
        sed -i 's/#fc6f5d/#1793d1/g' "${FILE}"
        sed -i 's/#d64937/#1793d1/g' "${FILE}"
        sed -i 's/#2d2d2d/#333333/g' "${FILE}"
        sed -i 's/#dedede/#eeeeee/g' "${FILE}"
        sed -i 's/#d9d9d9/#dedede/g' "${FILE}"
        sed -i 's/#f0f0f0/#ffffff/g' "${FILE}"
        sed -i 's/#f9f9f9/#ffffff/g' "${FILE}"
        sed -i 's/#bdbdbd/#cbcbcb/g' "${FILE}"
        sed -i 's/#f0544c/#1793d1/g' "${FILE}"
        sed -i 's/#444444/#333333/g' "${FILE}"
        sed -i 's/#444/#333/g' "${FILE}"
        sed -i 's/Numix/Numix-ArchBlue/' "${FILE}"
    done
}

package() {
  cd Numix
  make

  rm gtk-3.0/assets/*.png

  install -dm 755 "${pkgdir}"/usr/share/themes/Numix-ArchBlue
  rm -rf .git .gitignore CREDITS LICENSE README.md
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix-ArchBlue/
}

# vim: ts=2 sw=2 et:
