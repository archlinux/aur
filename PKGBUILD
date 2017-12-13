pkgname=msbuild-bin
pkgver=0.03
pkgrel=2
pkgdesc="Microsoft Build Engine"
arch=(i686 x86_64)
license=('MIT')
url="https://github.com/dotnet/corefx/blob/8b6efd4a91288d94b13f9757c6f1a3b356d39dd8/build.sh#L102"
depends=('mono')
makedepends=('nuget')
provides=('msbuild')
options=('!strip')
source=("https://github.com/Microsoft/msbuild/releases/download/mono-hosted-msbuild-v${pkgver}/mono_msbuild_d25dd923839404bd64cc63f420e75acf96fc75c4.zip")

build() {
  cd msbuild
}

package() {
echo
  
  install -d "$pkgdir/usr/share"
  cp -ra msbuild "$pkgdir/usr/share/"

  install -d "$pkgdir/usr/bin"
  echo '#!/bin/sh
mono /usr/share/msbuild/MSBuild.exe "$@"
' > "$pkgdir/usr/bin/MSBuild.exe"
chmod +x "$pkgdir/usr/bin/MSBuild.exe"
ln -s MSBuild.exe "$pkgdir/usr/bin/msbuild.exe"
ln -s MSBuild.exe "$pkgdir/usr/bin/msbuild"
}

md5sums=('14345c2f2dc53aa902a89419e234d2d4')
