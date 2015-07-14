# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=keepass-plugin-dev
_pkgname=KeePassPluginDevTools
pkgver=0.2.1
pkgrel=1
pkgdesc="Helper library for use with unit testing of KeyPass 2.x plugins."
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/dlech/KeePassPluginDevTools"
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dlech/KeePassPluginDevTools/archive/v$pkgver.tar.gz")
sha256sums=('4b4b77ce87c3ff2c12ad8c061de68fc31d803a46c13cd80e649ff312279af6ce')

build() {
    cd "$_pkgname-$pkgver"
    xbuild /property:Configuration=Release /property:KeePassPath=/usr/share/keepass/
}

package() {
    cd "$_pkgname-$pkgver/build/bin/Release"
    mkdir -p "${pkgdir}"/usr/share/keepass-plugin-dev
    cp Microsoft.Build.Plgx.xsd PlgxTool.exe KeePassLib.dll KeePassControl.xml Plgx.targets KeePassControl.dll Packager.exe.config ICSharpCode.SharpZipLib.dll Packager.exe "${pkgdir}"/usr/share/keepass-plugin-dev
}
