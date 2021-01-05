# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dia-git
_pkgname=dia
pkgver=6611.81fe2063
pkgrel=1
pkgdesc="A GTK+ based diagram creation program (GIT VERSION)"
arch=('x86_64')
license=('GPL')
url="http://live.gnome.org/Dia"
depends=('libxslt' 'gtk2' 'python' 'poppler' 'graphene')
makedepends=('git' 'cmake' 'meson' 'intltool' 'dblatex' 'docbook-xsl')
provides=('dia')
conflicts=('dia')
options=('docs' '!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/dia.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  meson --prefix /usr --buildtype=plain  . build 
  ninja -j1 -C build
}

package() {
  cd ${_pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
}
