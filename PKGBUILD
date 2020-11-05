# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# ^source?      ^taken?                     ^wat
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>
# Contributor: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_pkgname=matchbox-window-manager
pkgname=$_pkgname-git
pkgver=1.2.2.5.gbc880f5
pkgrel=1
pkgdesc="A pretty much unique X window manager with a classic PDA management policy"
arch=('any')
license=('GPL')
depends=('libmatchbox' 'libxcursor' 'startup-notification' 'gconf' 'libpng' 'libsm')
conflicts=('matchbox-window-manager')
url="http://matchbox-project.org/"
source=('matchbox-window-manager::git+https://git.yoctoproject.org/git/matchbox-window-manager.git')

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --tags |sed 's+-+.+g' 
}

build() {
   cd $_pkgname
   ./autogen.sh
   ./configure --sysconfdir=/etc --prefix=/usr \
      --enable-startup-notification --enable-session \
      --enable-alt-input-wins --enable-expat
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
