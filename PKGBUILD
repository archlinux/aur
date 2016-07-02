# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# terrarium-git
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=terrarium-git

# Version
pkgver=1.5.r9.g2050103
pkgrel=1
#epoch=

# Generic
pkgdesc="Live QML Editor and Viewer"
arch=('i686' 'x86_64')
url="http://www.terrariumapp.com"
license=('MIT')
#groups=()

# Dependencies
depends=('qt5-graphicaleffects')
#optdepends=()
makedepends=('git')
#checkdepends=()

# Package Relations
#provides=()
#conflicts=()
#replaces=()

# Others
#backup=()
#options=()
#install=
#changelog=

# Sources
source=("git+https://github.com/penk/terrarium-app.git")
#source_i686=()
#source_x86_64=()
#noextract=()
#validpgpkeys=()

# Integrity
md5sums=('SKIP')
#md5sums_i686=()
#md5sums_x86_64=()
#sha1sums=()
#sha256sums=()

pkgver() {
  cd $srcdir/terrarium-app
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/terrarium-app
  git submodule init
  git submodule update
}

build() {
  cd ${srcdir}/terrarium-app
  qmake && make
}

#check() {
#}

package() {
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/share/terrarium
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/terrarium-app/terrarium-app.png ${pkgdir}/usr/share/terrarium
  cp ${srcdir}/terrarium-app/Terrarium ${pkgdir}/usr/bin
  cd ${srcdir}/terrarium-app/platform/ubuntu
  sed s:./terrarium-app.png:/usr/share/terrarium/terrarium-app.png:g < terrarium.desktop > terrarium.desktop.new
  sed s:./Terrarium:/usr/bin/Terrarium:g < terrarium.desktop.new > ${pkgdir}/usr/share/applications/terrarium.desktop
}
