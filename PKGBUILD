# Maintainer: DelightedCat <bottledlactose@gmail.com>

pkgname=mgcb-editor-git
pkgver=3.8.0
pkgrel=2
pkgdesc="The MonoGame Content Pipeline tool"
arch=('x86_64')
url="https://www.monogame.net/"
license=('custom')
depends=('git' 'dotnet-sdk-3.1')
makedepends=('git' 'dotnet-sdk-3.1')

prepare() {
	cd $srcdir
	git clone --recursive https://github.com/MonoGame/MonoGame.git
}

build() {
	cd $srcdir/MonoGame
	dotnet cake

	


	#cd $srcdir/MonoGame/Tools/MonoGame.Content.Builder.Editor
	#dotnet restore MonoGame.Content.Builder.Editor.Linux.csproj
	#dotnet build MonoGame.Content.Builder.Editor.Linux.csproj -c Release
}

package() {
	cd $srcdir/MonoGame/Artifacts/MonoGame.Content.Builder.Editor/Launcher/Release

	mkdir -p $pkgdir/opt/mgcb-editor
	cp -r * $pkgdir/opt/mgcb-editor

	cd $pkgdir/opt/mgcb-editor/Content

	mkdir -p $pkgdir/usr/share/mime/text
	cp x-mgcb.xml $pkgdir/usr/share/mime/text
	
	cd $srcdir/..

	mkdir -p $pkgdir/usr/share/applications
	cp mgcb-editor.desktop $pkgdir/usr/share/applications
}
