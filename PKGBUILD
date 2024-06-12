# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# shellcheck disable=SC2034,2154
pkgname=jre-jetbrains
_major=21
_minor=0
_patch=3
_build=480.1
pkgver="${_major}.${_minor}.${_patch}b${_build}"
pkgrel=1
pkgdesc="OpenJDK Java $_major runtime with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://github.com/JetBrains/JetBrainsRuntime"
license=('GPL2')
depends=('java-runtime-common' 'ca-certificates-java' 'java-environment-common')
replaces=(jetbrains-jre)
conflicts=(jetbrains-jre)
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-environment=$_major"
    "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major" "jetbrains-jre")
_zipname="jbr_jcef-$_major.$_minor.$_patch-linux-x64-b$_build.tar.gz"
install=$pkgname.install
source=("https://cache-redirector.jetbrains.com/intellij-jbr/${_zipname}")
b2sums=('e074e5b754936a6c83efbb68c0f046bde6542b1d97e62ce5208b4e33c3eafd39aeffa818c37223ace087d2705fdc2abc90b0d52627e91edc9c73d068b733d1f6')

package() {
    rm "$srcdir/$_zipname"
    find "$srcdir" -exec chmod g+r,o+r {} +
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "$srcdir/jbr_jcef-$_major.$_minor.$_patch-linux-x64-b$_build" "$pkgdir/usr/lib/jvm/$pkgname"
    ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
