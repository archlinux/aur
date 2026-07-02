# Maintainer: CelDaemon <celdaemon at voidgroup dot net>

_major=25
_minor=0.3
_build=508.16

_javadir="/usr/lib/jvm/java-$_major-jetbrains"

pkgname=jdk$_major-jetbrains-bin
pkgver="$_major.${_minor}b$_build"
pkgrel=1
pkgdesc="Java Development Kit by Jetbrains"
arch=('x86_64' 'aarch64')
url="https://github.com/JetBrains/JetBrainsRuntime"
license=('GPL-2.0-or-later')
depends=(
    'java-runtime-common' 
    'ca-certificates-utils'
    'java-environment-common'
)
provides=(
    "jdk$_major-jetbrains"
    "java-environment=$_major"
    "java-environment-jetbrains=$_major"
    "java-runtime=$_major"
    "java-runtime-jetbrains=$_major"
    "jre$_major-jetbrains=$pkgver-$pkgrel"
    "java-runtime-headless=$_major"
    "java-runtime-headless-jetbrains=$_major"
    "jre$_major-jetbrains-headless=$pkgver-$pkgrel"
)
conflicts=("jdk$_major-jetbrains" "jre$_major-jetbrains" "jre$_major-jetbrains-headless")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://cache-redirector.jetbrains.com/intellij-jbr/jbrsdk-$_major.$_minor-linux-x64-b$_build.tar.gz")
sha512sums_x86_64=('cde0377bdcc47b3f04194540a472fbb29d43cb273095f413f2313fe44ed5a77bb50b4081103f9240518d61b56a010cf6ee9fcfc8b1176935fff80a7a0975715b')
source_aarch64=("$pkgname-$pkgver.tar.gz::https://cache-redirector.jetbrains.com/intellij-jbr/jbrsdk-$_major.$_minor-linux-aarch64-b$_build.tar.gz")
sha512sums_aarch64=('b46f25ba0cce323c01ce2fad0fa06c53afe430b577a5e3dd22ce8cdf90bd7cd90745c799a9ccdbfa8027b184b93811e1bc691e729f958ee03421622e560fea29')

package() {
    local _arch
    if [ "$CARCH" = 'x86_64' ]
    then
        _arch='x64'
    else
        _arch="$CARCH"
    fi
    cd "jbrsdk-$_major.$_minor-linux-$_arch-b$_build"

    install -dm 755 "$pkgdir$_javadir"
    cp -a bin include jmods lib release "$pkgdir$_javadir"

    install -dm 755 "$pkgdir/usr/share/licenses"
    cp -ar legal "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/usr/share/licenses/$pkgname" "$pkgdir$_javadir/legal"

    install -dm 755 "$pkgdir/etc"
    cp -ar conf "$pkgdir/etc/$pkgname"
    ln -s "/etc/$pkgname" "$pkgdir$_javadir/conf"
}
