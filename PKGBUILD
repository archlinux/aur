# Maintainer: Fijxu <fijxu at nadeko dot net>

pkgname=ilspycmd-git
_pkgname=ILSpy
pkgver=v10.0.preview2.r1.g4a29de5a4
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

# https://github.com/icsharpcode/ILSpy?tab=readme-ov-file#how-to-build
# `ICSharpCode.ILSpyCmd/ICSharpCode.ILSpyCmd.csproj` is the `ilspycmd` project
build() {
	cd "$srcdir/$_pkgname"
	dotnet build -c Release -o ../publish --no-self-contained ICSharpCode.ILSpyCmd/ICSharpCode.ILSpyCmd.csproj
}

package() {
	mkdir -p "$pkgdir/opt/ilspycmd/"
	mkdir -p "$pkgdir/usr/bin/"
	cp -R "$srcdir/publish/"* "$pkgdir/opt/ilspycmd/"
	chmod +x "$pkgdir/opt/ilspycmd/ilspycmd"
	ln -s "/opt/ilspycmd/ilspycmd" "$pkgdir/usr/bin/ilspycmd"
}
