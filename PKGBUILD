# Maintainer Haskellfant <moritz.kiefer@purelyfunctional.org
pkgname=zam-plugins-git
pkgver=3.5.r84.g922601d
pkgrel=1
pkgdesc="Collection of LV2/LADSPA/VST audio plugins for high quality processing"
arch=('i686' 'x86_64')
url="https://github.com/zamaudio/zam-plugins"
license=('GPL2')
provides=('zamplugins')
depends=('gcc-libs')
makedepends=('git' 'pkg-config' 'libx11' 'libgl' 'liblo' 'jack' 'ladspa')
optdepends=()
source=("$pkgname"::'git://github.com/zamaudio/zam-plugins.git'
        "dpf"::'git://github.com/DISTRHO/DPF.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.dpf.url "$srcdir/dpf"
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
