# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=mono-addins-git
_pkgname=mono-addins
pkgver=1.3.3
pkgrel=1
pkgdesc="Generic framework for creating extensible applications, and for creating add-ins which extend those applications."
arch=('i686' 'x86_64')
url="https://github.com/mono/mono-addins"
source=(https://github.com/mono/mono-addins/archive/mono-addins-1.3.3.tar.gz)
license=('MIT')
provides=("$_pkgname")
depends=('bash' 'gtk-sharp-2' 'gtk-sharp-3')
makedepends=('pkgconfig' 'msbuild')

build() {
  cd "$srcdir"/${_pkgname}-${_pkgname}-${pkgver}
  ./autogen.sh --prefix=/usr --enable-gui
  make
}

package() {
  cd "$srcdir"/${_pkgname}-${_pkgname}-${pkgver}
  msbuild.exe Mono.Addins/Mono.Addins.csproj /p:WarningLevel=0;Configuration=Release
  msbuild.exe Mono.Addins.CecilReflector/Mono.Addins.CecilReflector.csproj /p:WarningLevel=0;Configuration=Release
  msbuild.exe Mono.Addins.Gui/Mono.Addins.Gui.csproj /p:WarningLevel=0;Configuration=Release
  msbuild.exe Mono.Addins.GuiGtk3/Mono.Addins.GuiGtk3.csproj /p:WarningLevel=0;Configuration=Release
  msbuild.exe Mono.Addins.MSBuild/Mono.Addins.MSBuild.csproj /p:WarningLevel=0;Configuration=Release
  msbuild.exe Mono.Addins.Setup/Mono.Addins.Setup.csproj /p:WarningLevel=0;Configuration=Release
  make DESTDIR="${pkgdir}" install
}
md5sums=('7ac27ffa4616fd03dc299749f16bce2a')
