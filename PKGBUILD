# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: tommyshem
# Contributor: Atnanasis <ys2000pro@gmail.com>
# Contributor: Youngbin Han <sukso96100@gmail.com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>

pkgname=micro-nightly-bin
pkgver=2.0.0.28
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
depends=('glibc')
makedepends=('grep' 'curl' 'sed')
optdepends=('xclip: for copying to and from the terminal')
conflicts=('micro' 'micro-bin' 'micro-git')
provides=('micro')

#for example 2.0.0-rc2.dev.28 or 2.0.0-rc2.28
_realver=$(curl -s https://api.github.com/repos/zyedidia/micro/releases/tags/nightly | grep -om 1 'micro-[0-9a-z.-]*-linux' | sed 's/-linux//;s/micro-//')
source_x86_64=("https://github.com/zyedidia/micro/releases/download/nightly/micro-$_realver-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/nightly/micro-$_realver-linux32.tar.gz")

md5sums_x86_64=('SKIP')
md5sums_i686=('SKIP')

pkgver() {
	echo $_realver | sed 's/-rc[[:digit:]]//;s/.dev//'
}

package() {
	install -Dm755 "$srcdir/micro-$_realver/micro" "$pkgdir/usr/bin/micro"
	install -Dm644 "$srcdir/micro-$_realver/LICENSE" "$pkgdir/usr/share/licenses/micro/LICENSE"
}
