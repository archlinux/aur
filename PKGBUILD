# Contributor: Russ Gibson <russ@russgibson.org>
# Maintener: Frederic Bezies <fredbezies@gmail.com>
# Maintainer: CubeTheThird <cubethethird@gmail.com>

pkgname=liferea-git
_gitname=liferea
pkgver=v1.12.6.r79.gd58c09c2
pkgrel=1
epoch=1
pkgdesc="A news aggregator for GTK, git version."
arch=('i686' 'x86_64' 'aarch64')
url="https://lzone.de/liferea/"
license=('GPL')
depends=('libpeas' 'webkit2gtk')
makedepends=('autoconf' 'intltool' 'git' 'gobject-introspection' 'gconf')
optdepends=('python-gobject' 'python-cairo' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-base')
provides=('liferea')
conflicts=('liferea' 'liferea-unstable')
options=('!libtool' '!emptydirs')
source=('git+https://github.com/lwindolf/liferea.git')
sha1sums=('SKIP')

pkgver() {
	cd liferea
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd liferea

  ./autogen.sh --prefix=/usr
  make 
} 

package() {
    cd liferea
    make DESTDIR="$pkgdir" install

    install -d "${pkgdir}/usr/share/gconf/schemas"
}

