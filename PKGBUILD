# Maintainer: Gildásio Júnior <gildasiojunior_at_riseup_dot_net>

pkgname=slock-dracula
pkgver=1.4
pkgrel=1
pkgdesc="Simple X display locker using Dracula Theme colors"
arch=('x86_64' 'i686' 'armv7h')
url="https://tools.suckless.org/slock/"
license=('MIT')
depends=('libxcrypt' 'libxrandr')
provides=(slock)
conflicts=(slock)
source=("https://dl.suckless.org/tools/slock-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
sha256sums=('b53849dbc60109a987d7a49b8da197305c29307fd74c12dc18af0d3044392e6a'
            'e77de0e7f972c3cd61bd8ba7d92f937fd15ac349df83c2520f7322a93e3346ac')

prepare() {
	cd "slock-$pkgver"
    sed -i 's/nogroup/nobody/g' config.def.h
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "slock-$pkgver"
	make
}

package() {
	cd "slock-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
