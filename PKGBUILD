# $Id$
# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=adriconf-git
pkgver=0.9.1
pkgrel=12
pkgdesc="Graphical configuration tool for the Direct Rendering Infrastructure"
arch=('any')
url="https://github.com/jlHertel/adriconf"
license=('GPL')
depends=('gtk3')
source=(git+https://github.com/jlHertel/adriconf.git
	adriconf.desktop
	adriconf-icon.png)
sha256sums=('SKIP'
            '1d13c7efdb9aab23dd963c2ce2cbbb25b32039611e4b7b314684967d7432eea4'
            'd7354c488a3b8dd04d0758569a2268c631475fb07d38eb38e4f5afeea958a5ae')

prepare() {
  cd adriconf
  git pull origin pull/4/head --no-edit
}

build() {
  mkdir -p adriconf-build; cd adriconf-build
  cmake ../adriconf
  make
}

package() {
  cd adriconf-build
  #make install
  install -d "$pkgdir"/usr/bin
  install -m755 adriconf "$pkgdir"/usr/bin

  install -d "$pkgdir"/usr/share/applications
  install "$srcdir"/adriconf.desktop "$pkgdir"/usr/share/applications

  install -d "$pkgdir"/usr/share/icons
  install "$srcdir"/adriconf-icon.png "$pkgdir"/usr/share/icons
}
