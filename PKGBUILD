# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=triceratops-lv2
pkgver=0.3.1
pkgrel=1
pkgdesc="Polyphonic synthesizer LV2 plugin"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/triceratops/"
license=('GPL3')
groups=('lv2-plugins')
depends=('gtkmm' 'lv2')
makedepends=('python2')
source=("http://downloads.sourceforge.net/project/triceratops/$pkgname-v$pkgver.tar.gz")
noextract=("$pkgname-v$pkgver.tar.gz")
md5sums=('cdd3e94b05247061820e17d7c3d900e4')

prepare() {
    cd "$srcdir"
    rm -rf "$pkgname-$pkgver"
    mkdir "$pkgname-$pkgver"
    tar -xzf "$srcdir/$pkgname-v$pkgver.tar.gz" -C "$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 waf install --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
