# Mantainer: 3ED <krzysztof1987 at gmail>
# Contributor: adlerweb <get on aur>

pkgname=pluma-plugins
_reponame=cygwinports
pkgver=1.8.0
epoch=1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/${_reponame}/${pkgname}"
license=('GPL')
depends=('pluma' 'mate-common')
#makedepends=('autoconf-2.5' 'automake-1.12')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${_reponame}/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d27bd9e7aa05d0bd23812d6087646880019f15d26cb94fc3e857c3806f228fe9')

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
