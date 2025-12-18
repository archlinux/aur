# Maintainer: Thomas Sänger <thomas@gecko.space>
# Contributor: Ettore Chimenti <ek5.chimenti @ gmail.com>
pkgname="init-headphone"
pkgver="0.14"
pkgrel=1
pkgdesc="Re-enables headphone jack after sleep/suspend resume on Clevo notebooks"
arch=("any")
url="https://github.com/Unrud/init-headphone"
license=('GPL3')
makedepends=('git')
depends=("python")
install=init-headphone.install
source=("git::git+https://github.com/Unrud/init-headphone#tag=v$pkgver"
	"init-headphone.install")
b2sums=('SKIP'
	'fef920e0eddbf035b266b9604963773d31870b3105b2a0ef20effe259ed9fa132e74861b4610a8ca9e1f2130d0d934ae59ae49a76901a4cb608bc78bba989979')

build(){
	cd "$srcdir/git"
	./autogen.sh
	./configure  --prefix="$pkgdir/usr/" --with-systemdsystemunitdir="$pkgdir/usr/lib/systemd/system"
	make
	sed "s,$pkgdir,," -i init-headphone.service
}

package() {
	cd "$srcdir/git"
	make install

	mv $pkgdir/usr/{sbin,bin}
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

