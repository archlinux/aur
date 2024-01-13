# Maintainer: Fijxu <fijxu at nadeko dot net>

pkgname=ilspycmd-git
_pkgname=ILSpy
pkgver=v8.2.r42.g5a6f9b88a
pkgrel=1
pkgdesc=".NET Decompiler with support for PDB generation, ReadyToRun, Metadata (&more) - cross-platform! (git version)"
arch=('any')
url="https://github.com/icsharpcode/ILSpy"
depends=('dotnet-runtime' 'powershell')
makedepends=('git' 'dotnet-host' 'dotnet-sdk')
license=('MIT')
source=("git+https://github.com/icsharpcode/ILSpy")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
		git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname/ICSharpCode.ILSpyCmd"
	dotnet build -c Release -r linux-x64 -o ../publish --no-self-contained
}

package() {
	mkdir -p "$pkgdir/opt/ilspycmd/"
	mkdir -p "$pkgdir/usr/bin/"
	cp -R "$srcdir/$_pkgname/publish/"* "$pkgdir/opt/ilspycmd/"
	chmod +x "$pkgdir/opt/ilspycmd/ilspycmd"
	ln -s "/opt/ilspycmd/ilspycmd" "$pkgdir/usr/bin/ilspycmd"
}

