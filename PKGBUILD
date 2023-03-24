# Maintainer: Tommaso Leonardi <aur@itm6.xyz>
pkgname=git-branch-name
pkgver='0.0.2'
pkgrel=1
pkgdesc='Optimally fast branch name command for Git'
arch=('x86_64')
url='https://github.com/itchyny/git-branch-name'
license=('MIT')
depends=('glibc')
provides=('git-branch-name')
source=("$pkgname-$pkgver.tar.gz::https://github.com/itchyny/git-branch-name/archive/v$pkgver.tar.gz")
noextract=()
b2sums=('17ede2e043317ab15d721b41583c27c29576d2fd38e692ab67845f82816986c442ab7d55908ed88653d2b7c39c4974a0b11e7ca31a9c5a1d8e509673d11a1a98')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	./git-branch-name --help &> /dev/null
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
