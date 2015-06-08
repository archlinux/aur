# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=pkgconf-git
pkgver=0.9.11.3.gfc18a9d
pkgrel=2
pkgdesc='pkg-config compatible utility which does not depend on glib'
url='https://github.com/pkgconf/pkgconf'
arch=('i686' 'x86_64')
license=('ISC')
makedepends=('popt' 'git')
conflicts=('pkg-config' 'pkgconfig' 'pkgconf')
provides=('pkg-config' 'pkgconfig' 'pkgconf')
replaces=('pkg-config' 'pkgconfig' 'pkgconf')
source=(git://github.com/pkgconf/pkgconf.git)
md5sums=('SKIP')

pkgver() {
  cd pkgconf
  git describe --tags | sed 's/^v//;s/-/./g;s/pkgconf.//'
}

build() {                                                                       
  cd pkgconf
  ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --localstatedir=/var
  make
}

package() {
  cd pkgconf
  make DESTDIR="$pkgdir" install
  ln -s /usr/bin/pkgconf "$pkgdir"/usr/bin/pkg-config
}
