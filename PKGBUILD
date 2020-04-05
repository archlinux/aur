# Maintainer: Yuval Dahan <yuvaldahn at gmail dot com>
# Maintainer: Amit Botzer <botzer.2002 at gmail dot com>

pkgname=locker
pkgver=0.5.4
pkgrel=0
pkgdesc='linux container'
arch=('x86_64')
gitrepo=amit-yuval
url='https://gitlab.com/$gitrepo/locker'
license=('GPL')
makedepends=('go-pie')
optdepends=('apparmor: For use of apparmor features'
            'iproute2: For network setup')
source=("https://gitlab.com/$gitrepo/locker/-/archive/V$pkgver/locker-V$pkgver.tar.gz")
sha512sums=('5287ee6257ba959a9c38d178ea28af53139895d3d54f9b96054ffd397524b30b18eafa7296dae26e26834c4bb73a6bf3836600d00b56d9570d782361007c9efb')
backup=('etc/locker/seccomp_default.json'
        'var/lib/locker/images.json')

build() {
  cd $pkgname-V$pkgver
  make
}

check() {
  cd $pkgname-V$pkgver
  make exec run="go test ./..."
}

package() {
  cd $pkgname-V$pkgver
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et nowrap:
