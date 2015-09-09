# Maintainer: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn-fork
_name=inadyn
pkgver=1.99.15
pkgrel=1
pkgdesc='Simple dynamic DNS client - fork of the original INADYN implementation from Narcis Ilisei'
url='http://troglobit.com/inadyn.html'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL')
depends=('openssl')
backup=('etc/inadyn.conf')
conflicts=('inadyn-opendns' 'inadyn' 'inadyn-mt' 'inadyn-fork-git')
provides=('inadyn')
source=(https://github.com/troglobit/inadyn/releases/download/$pkgver/${_name}-$pkgver.tar.xz
        inadyn.conf
        inadyn.service)
sha256sums=('b54ed82653e9bd6624e579433907aecfd3e83bdab9ed0b3c21d6817c799ac715'
            '2da656ca5b971484c7e033e9e9bcd26afbf4fa08f707f7ca44d954d1646353d7'
            '4587f4ae2a4215f9ba67d5b3b7d0aa120a9ebd31677472fa68d8792f42d7135f')

build(){
  cd ${_name}-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --enable-openssl
  export prefix=/usr  # libite needs this
  make
}

package(){
  cd ${_name}-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 ../inadyn.service $pkgdir/usr/lib/systemd/system/inadyn.service
  install -Dm600 ../inadyn.conf $pkgdir/etc/inadyn.conf
}
