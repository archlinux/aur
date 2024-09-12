# Maintainer: Mike Beaumont <mike@beaumont.dev>
# Contributor: bkuri <aur+nzbget-git@bkuri.com>
# Contributor: selfdenial <selfdenial@pm.me>
# Contributor: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=nzbget-bin
pkgver=24.3
pkgrel=1
pkgdesc="Download from Usenet using .nzb files (nzbget.com fork)"
arch=('x86_64')
url="https://github.com/nzbgetcom/nzbget"
license=('GPL')
depends=('libxml2' 'openssl')
optdepends=('python: run scripts'
            'unrar: unpacking archives'
            'p7zip: unpacking archives'
            'par2cmdline: verificate and repair PAR 2.0 files')
provides=('nzbget' 'nzbget-systemd')
conflicts=('nzbget' 'nzbget-systemd')
install=nzbget.install
source=("nzbget-${pkgver}-amd64.deb::https://github.com/nzbgetcom/nzbget/releases/download/v${pkgver}/nzbget-${pkgver}-amd64.deb"
        "nzbget.service")
sha256sums=('bac310b40cb7ae403da9f84ec810febaf95df6b6d1b209aa6392ac433fcfff56'
            'e92d2d09e56930475c9f28641a3326a17aa187834e1bd6328a65b6ed7cc25e99')

prepare() {
  mv "nzbget-${pkgver}-amd64.deb" "$pkgname-$pkgver.deb"

  ar x "$pkgname-$pkgver.deb"
  tar xf data.tar.xz
}

package() {
  cp -r usr "$pkgdir"

  install -Dm644 nzbget.service "$pkgdir/usr/lib/systemd/system/nzbget.service"

  install -dm 750 "${pkgdir}/var/lib/nzbget"
}
