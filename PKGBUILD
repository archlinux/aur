# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=vym-devel
pkgver=2.6.8
pkgrel=1
pkgdesc="A mindmapping tool"
arch=('i686' 'x86_64')
url="http://www.insilmaril.de/vym/"
license=('GPL')
depends=('qt5-svg' 'desktop-file-utils')
install=$pkgname.install
source=(https://sourceforge.net/projects/vym/files/Development/vym-$pkgver.tar.bz2
        vym.desktop)
sha256sums=('2ec528b2f9783ea12a80471f1cfcbefcb5eeac42bf5f3c5209ef334c6c561aba'
            'e299c69c213e7aac3f5b5d0ab088132b4ec7cb63a391f272e75ed64f049d541b')

build() {
  cd "${srcdir}"/vym-$pkgver

  qmake PREFIX=/usr/share
  make
}

package() {
  cd "${srcdir}"/vym-$pkgver

# install files
  make INSTALL_ROOT="${pkgdir}" install

# fix executable path
  mv "${pkgdir}"/usr/share/bin "${pkgdir}"/usr/bin

# install documentation
  install -Dm644 "${srcdir}"/vym-$pkgver/doc/vym.1.gz \
    "${pkgdir}"/usr/share/man/man1/vym.1.gz
  install -Dm644 "${srcdir}"/vym-$pkgver/doc/vym.pdf \
    "${pkgdir}"/usr/share/doc/$pkgname/vym.pdf
  rm -rf "${pkgdir}"/usr/share/doc/packages

# .desktop and icon file
  install -Dm644 "${srcdir}"/vym.desktop \
    "${pkgdir}"/usr/share/applications/vym.desktop
  install -Dm644 "${pkgdir}"/usr/share/vym/icons/vym.png \
    "${pkgdir}"/usr/share/pixmaps/vym.png
}
