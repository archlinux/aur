# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mohamed Sobh <mohamed.alhusieny@gmail.com>
# Contributor: Drew Noel <drewmnoel@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.29.0
pkgrel=1
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
sha256sums=('1c6d6da20b0705f61aa9478797e8c336ef6a6b986ce04e1800f6baa5f3c2e3a3'
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
