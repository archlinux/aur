# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=swapspace
pkgver=1.10
pkgrel=4
pkgdesc="A dynamic swap manager"
arch=('i686' 'x86_64')
url="http://pqxx.org/development/swapspace"
license=('GPL')
backup=(etc/swapspace.conf)
source=(http://pqxx.org/download/software/swapspace/$pkgname-$pkgver.tar.gz
        Makefile.patch
        swapspace.confd
        systemd.scripts.swapspace
        systemd.system.swapspace)
sha256sums=('37256d6759be5cefbb50afbeba8bb0f159b3488aecd972898fcc6f4d5e6a3573'
            'bc7abed7a240e5b5ebb183cb2d1f2fb65dfb4864fc8c56a2d6f18bec5d5abc8b'
            '233fec29540b5cf7ae3d49d34deac9a9a044665bd942e817d6b98ae3a91b9857'
            'c720cc5687cd8277489b2fe4b74d11cdb050540a982614cfbbad4f2d9a609ecf'
            'ba2bfba29da4e6423dadff438b57831f75e8a362c2f9526fa1387e9bab6ddc77')
options=(!buildflags)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ${srcdir}/Makefile.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 ../swapspace.confd "${pkgdir}"/etc/conf.d/swapspace

  install -Dm755 ../systemd.scripts.swapspace \
    "${pkgdir}"/usr/lib/systemd/scripts/swapspace
  install -Dm644 ../systemd.system.swapspace \
    "${pkgdir}"/usr/lib/systemd/system/swapspace.service
}

# vim:set ts=2 sw=2 et:
