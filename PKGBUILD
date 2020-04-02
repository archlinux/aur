# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mohamed Sobh <mohamed.alhusieny@gmail.com>
# Contributor: Drew Noel <drewmnoel@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.28.0
pkgrel=3
pkgdesc='A font editor which can generate fonts in TTF, EOT, SVG and BIRDFONT format'
arch=('x86_64' 'i686')
url='https://birdfont.org'
license=('GPL3')
depends=('libgee'
         'webkit2gtk'
         'libnotify'
         'libxmlbird')
makedepends=('vala'
             'gettext'
             'python')
source=("$url/releases/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('3fbb1bf7c735e4d67442ee5740e2e0ed29cb5ce56508c0c96d2599f8ece727a6'
            'SKIP')
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>

build() {
	cd "$pkgname-$pkgver"
	./configure -p /usr --ldflags="$(pkg-config --libs cairo-gobject)"
	./build.py
}

package() {
	cd "$pkgname-$pkgver"
	./install.py -d "$pkgdir" -n /share/man/man1 -l /lib
}
