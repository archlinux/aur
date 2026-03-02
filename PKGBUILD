# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# shellcheck disable=SC2034,2154
pkgname=jre-jetbrains
_major=25
_minor=0
_patch=2
_java_version=$_major.$_minor.$_patch
_build=329.70
pkgver="${_java_version}b${_build}"
pkgrel=1
pkgdesc="OpenJDK Java $_major runtime with some fixes and enhancements by JetBrains"
arch=('x86_64')
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
b2sums=('ded900c9fe0dd5790856b14fc664d029cbd7262209f4019fb6c83df6c327e0112d2a7e0ee54f0f906ae33f315cd436254a8331bb51a1f4cf336a455c7a44cffa')

package() {
    rm "$srcdir/$_zipname"
    find "$srcdir" -exec chmod g+r,o+r {} +
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "$srcdir/jbr_jcef-$_java_version-linux-x64-b$_build" "$pkgdir/usr/lib/jvm/$pkgname"
    ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
