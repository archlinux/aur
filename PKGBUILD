# Maintainer: Fijxu <fijxu <at> zzls.xyz>

pkgname=ilspycmd-git
_pkgname=ILSpy
pkgver=r7581.0bab8a01e
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
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

