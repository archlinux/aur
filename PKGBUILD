# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

_pkgname=bleachbit
pkgname=bleachbit-git
pkgver=r3751.87065211
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy.'
url='https://www.bleachbit.org/'
license=('GPL3')
source=('git://github.com/bleachbit/bleachbit.git')
sha256sums=('SKIP')
arch=('any')
depends=('python2' 'gtk2' 'pygtk' 'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme')
conflicts=('bleachbit')
provides=('bleachbit')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${_pkgname}

  # use python2
  for file in $(find . -name '*.py' -print); do
      sed -i -e 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' \
        -e 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "$file"
  done
  sed -i 's/python/python2/g' Makefile
}

package() {
  cd ${srcdir}/${_pkgname}
  make prefix=/usr DESTDIR="$pkgdir" PYTHON=python2 install
}
