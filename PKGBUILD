# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ryon Sherman <ryon.sherman@gmail.com>
# Contributor: Dardo Marasca <gefarion@gmail.com>
# Contributor: Kevin Kyzer <kev@k3v.in>

pkgname=mudlet
pkgver=1.1.1
pkgrel=4
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mudlet/"
license=('GPL')
depends=('lua' 'qscintilla' 'qt4')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}-src.tar.gz mudlet.patch)
md5sums=('0710ec2c9c146633ef8b659a1183b612' 'c2055054ded3fc98c8cc5a954256f16c')

build() {
  cd ${srcdir}/${pkgname}/src
  patch -Np3 -i ../../mudlet.patch
  qmake
  make
}


package() {
  #binary
  install -D ${srcdir}/${pkgname}/src/${pkgname}  ${pkgdir}/usr/bin/${pkgname} || return 1

  #.desktop file and icon
  install -D -m644 ${srcdir}/${pkgname}/${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop || return 1
  install -D -m644 ${srcdir}/${pkgname}/${pkgname}.svg \
    ${pkgdir}/usr/share/pixmaps/${pkgname}.svg || return 1
}

