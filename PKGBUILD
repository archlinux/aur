# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# shellcheck disable=SC2034,2154
pkgname=jre-jetbrains
_major=25
_minor=0
_patch=4.1
_java_version=$_major.$_minor.$_patch
_build=610.67
pkgver="${_java_version}b${_build}"
pkgrel=2
pkgdesc="OpenJDK Java $_major runtime with some fixes and enhancements by JetBrains"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/JetBrains/JetBrainsRuntime"
license=('GPL-2.0-only')
depends=('java-runtime-common' 'ca-certificates-java' 'java-environment-common')
replaces=(jetbrains-jre)
conflicts=(jetbrains-jre)
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-environment=$_major"
    "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major" "jetbrains-jre")
_zipname="jbr_jcef-$_java_version-linux-x64-b$_build.tar.gz"
install=$pkgname.install
source=("https://cache-redirector.jetbrains.com/intellij-jbr/${_zipname}")
b2sums=('2f8d9bbab100c27907ceee3205970e88987ba916670b282c587d3d751429a8ab18300b60ef884050fc5e258170820b08e3b868e658dd4b968ba054fc6f090eec')

package() {
    rm "$srcdir/$_zipname"
    find "$srcdir" -exec chmod g+r,o+r {} +
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "$srcdir/jbr_jcef-$_java_version-linux-x64-b$_build" "$pkgdir/usr/lib/jvm/$pkgname"
    ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
