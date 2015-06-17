# Maintainer: M0Rf30 < morf3089 at gmail dot com >

pkgname=kdeplasma-applets-veromix-git
pkgver=29.813dcbd
pkgrel=1
pkgdesc="A plasmoid mixer for the Pulseaudio sound server"
url="https://github.com/M0Rf30/veromix-plasmoid"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('kdebindings-python2' 'kdebase-workspace' 'python2-pyqt4' 'pulseaudio' 'pyxdg' 'python2-dbus')
conflicts=('kdeplasma-applets-veromix' 'veromix-git')
makedepends=('git' 'kdesdk-dev-scripts')
optdepends=('pulseaudio-equalizer'
            'swh-plugins: equalizer and other effects support')
source=('veromix-plasmoid::git://github.com/M0Rf30/veromix-plasmoid.git#branch=stable')
install=${pkgname}.install

build() {
  cd veromix-plasmoid

        make build      
}
package() {
  cd veromix-plasmoid
        make DESTDIR=${pkgdir} install-plasmoid
		
        # Generating bytecode
	cd ${pkgdir}
	
        python2 -m compileall .
}

pkgver() {
  cd veromix-plasmoid
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

md5sums=('SKIP')
