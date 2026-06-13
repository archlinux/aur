# Maintainer: CelDaemon <celdaemon at voidgroup dot net>

_major=25
_minor=0.3
_build=508.4

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
sha512sums_x86_64=('3c9cf4b5904530cb602888eea1425d726f7b1c506ab5de0fae238ec1f3355ae020b67ef91b3f478352f19e778ab8e451c28360fc2fdc788bed9340531dd00f58')
source_aarch64=("$pkgname-$pkgver.tar.gz::https://cache-redirector.jetbrains.com/intellij-jbr/jbrsdk-$_major.$_minor-linux-aarch64-b$_build.tar.gz")
sha512sums_aarch64=('5b2a34bc4054d86e4f5c2ca89db1ea89b5ca0dae41152db9f8dafe0d6cab07dcb29a3f750b5c3927ec2d7b2f0a007797c8f237dd0b6ae709a34ef362e5f052ad')

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
    cp -r legal "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/usr/share/licenses/$pkgname" "$pkgdir$_javadir/legal"
}
