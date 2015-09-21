# Mantainer: 3ED <krzysztof1987 at gmail>
# Contributor: adlerweb <get on aur>

pkgname=pluma-plugins
pkgver=1.8.0
_cygrel=1
epoch=1
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/${_reponame}/${pkgname}"
license=('GPL')
depends=('pluma' 'mate-common')
source=(${pkgname}-${pkgver}.tar.gz::http://cygwin.cathedral-networks.org/x86/release/${pkgname}/${pkgname}-${pkgver}-${_cygrel}-src.tar.xz)
sha256sums=('1c14155ef4474ebb2850d67eb042776c49e4689d515876a015e59146e7fd2eb3')

prepare() {
  cd "$srcdir"
  bsdtar -xvf "$srcdir/${pkgname}-${pkgver}-${_cygrel}.src/${pkgname}-${pkgver}.tar.gz"
}
build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./autogen.sh \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname} \
    --with-plugins=all \
    --with-gtk=2.0 \
    --enable-gtk-doc \
    --enable-python 

  # For SMP look at MAKEFLAGS="-j8" (where 8 is 8 cpus/cores) in /etc/makepkg.conf
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
