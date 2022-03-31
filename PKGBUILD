# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Nikola Hadžić <nikola@firemail.cc>

pkgname=reddio
pkgver=0.52
pkgrel=1
pkgdesc='A command-line interface for Reddit written in POSIX sh'
arch=('any')
url='https://gitlab.com/aaronNG/reddio'
license=('MIT')
conflicts=('reddio-git')
makedepends=('git')
depends=('curl' 'jq')
optdepends=('gnu-netcat: for authentication'
            'openbsd-netcat: for authentication'
	    'dash: POSIX compliant shell'
	    'ksh: POSIX compliant shell')
source=("git+$url.git#commit=6ed832c095f1aa038c928599ee5b16b2852e9c3a") # 0.52
#source=("https://gitlab.com/aaronNG/$pkgname/-/archive/v.$pkgver/$pkgname-v.$pkgver.tar.gz")
sha512sums=('SKIP')

prepare() {
	#sed -i 's|usr/local|usr|g' "$pkgname-v.$pkgver/reddio"
	sed -i 's|usr/local|usr|g' reddio/reddio
}

package() {
	make PREFIX='/usr' DESTDIR="$pkgdir" -C reddio install

	install -Dm644 reddio/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
