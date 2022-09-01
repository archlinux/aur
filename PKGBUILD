# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=fyre
pkgver=1.0.1
pkgrel=14
pkgdesc="Rendering of the Peter de Jong map"
arch=('x86_64')
url="https://github.com/davidt/Fyre"
license=('GPL')
depends=('libglade' 'gnet' 'shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils')
source=("https://src.fedoraproject.org/repo/pkgs/fyre/fyre-1.0.1.tar.bz2/3058bb171f76ced74f79d876f296ac6f/fyre-1.0.1.tar.bz2"
				"error-handling.patch"
				"format-strings.patch")
sha512sums=('8e65e6ef05c2919659e173b04815579cd550a5d98539860d600d2dd68561493badb98b3eff2cf131335aee9b8b848ceb30956c194a7a69b855e9397679c1c675'
            '8736f05cf152bc10e1d4f5cdb0df2047d6d4cc2e6176c70e21504bb41b5bfe2ac5531ecf2197f02aecaea685de6bab94be400e8423efcae52472a5750bf09ab1'
            '96e3736e32a8381d753a71a5869f6a2cea91bc73ec38859d24fcfc3dcfc55356cc5cee5a687e7085917a7793de2bf4cb483b6955921e4c7e4da52282df53270c')

prepare() {
  cd ${pkgname}-${pkgver}/
  patch -p1 < ../../error-handling.patch
  patch -p1 < ../../format-strings.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-openexr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make update_xdgmime=/bin/false update_fdodesktop=/bin/false gtk_update_icon_cache=/bin/false \
    prefix="${pkgdir}/usr" install
}
