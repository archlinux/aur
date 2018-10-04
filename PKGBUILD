# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: tommyshem
# Contributor: Atnanasis <ys2000pro@gmail.com>
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=1.4.2.29
pkgrel=1
# Needed because of constant versioning changes...
epoch=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
depends=('glibc')
makedepends=('grep' 'curl' 'wget' 'tar' 'sed')
optdepends=('xclip: for copying to and from the terminal')
conflicts=('micro')
provides=('micro')
_realver=$(curl -s 'https://api.github.com/repos/zyedidia/micro/releases/tags/nightly' | grep -oEm 1 'micro\-([0-9]+\.?)+(\-dev.+)?\-linux' | grep -oE '([0-9]+\.?)+(\-dev(\.[0-9]+)?)?')
pkgver() {
	echo $(echo $_realver | sed 's/-dev//')
}
build() {
	if [[ $CARCH == "i686" ]]; then
		_bits="32"
	else
		_bits="64"
	fi
	_filename="micro-$_realver-linux$_bits.tar.gz"
	cd "$srcdir"
	wget "https://github.com/zyedidia/micro/releases/download/nightly/$_filename"
	tar -xf "$_filename"
}
package() {
	install -Dm755 "$srcdir/micro-$_realver/micro" "$pkgdir/usr/bin/micro"
	install -Dm644 "$srcdir/micro-$_realver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
