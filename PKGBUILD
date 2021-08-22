# Maintainer: Roberto Anic Banic <nicba1010@gmail.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT org>

pkgname=downpour
pkgver=0.2.1
pkgrel=1
pkgdesc="Web-based BitTorrent client supporting auto-downloading from RSS and importing and renaming into a media library."
arch=(any)
url="https://github.com/jjongsma/downpour"
license=('GPL')
makedepends=('python2-distribute')
depends=('python2' 'python2-twisted' 'sqlite3' 'python2-storm' 'python2-jinja' 'libtorrent' 'python2-feedparser' 'python2-dateutil')
options=(!emptydirs)
install=downpour.install
source=(https://github.com/jjongsma/downpour/archive/refs/tags/v$pkgver.tar.gz
  downpour.cfg downpour.install downpour.service)
sha256sums=('5533734d8febef96bfd384e882828ce791b6f9d8b0667328399c764a18f39bba'
            '92c38a126edd17c25d1da060af5e704d81aa9acbef756a6255f9568a0f89524b'
            '952c197485b1ab33174c036304bd9e8afba5851ce049433550780cf7e6a4e339'
            '76714f17aa69805bd7ba3c0390c811c054c3ead6fe12bd6d7b948c45319d5734')
sha512sums=('69bce78122af4e4c50bcea96bfdb81ea646cb9dff708cbdd122222e3aee2f8b3f95471fd51627bcd81fd5dd4ab401f38fdf62f508bc4f541a1838c44d9e7f864'
            'ca9a3ac72ee5ed5c0298f6db57f3dc3ff536c632bf7a2d20d819afe7194fda1e6143e0655cd293aaa64764817ba74c3693a59d7a3ec55589352e534453d02118'
            'e08447ea04e3a5d84b0beb4bed3e2e69757c8175b121c2bfa735ec12043f54b28c25bd748cf89af6b635d4b7b4b8b520cccbb0f0c60d0feedad602ba268bad3f'
            '84b56784d87bdaf5184be9762613c91725524808930546df4e5b2a2d73b784f40075bfbdbbe118932137d3015a6e97bc3c829e3875ba6f6bcb077e1d17c9bf48')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 cfg/downpour.cfg "${pkgdir}/etc/downpour.cfg"
  install -m755 -d "${pkgdir}/var/lib/downpour/downloads"
  install -m755 -d "${pkgdir}/var/lib/downpour/tmp"
  install -Dm644 "${srcdir}"/downpour.service "${pkgdir}/usr/lib/systemd/system/downpour.service"
}
