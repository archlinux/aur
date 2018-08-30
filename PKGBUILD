# Maintainer: dctxmei <dctxmei@gmail.com>
pkgname=hmcl-git
_pkgname=HMCL
pkgver=3.0
pkgrel=1
pkgdesc="A powered Minecraft launcher that supports a lot of features."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('jre')
makedepends=("git" "jdk")
provides=('hmcl')
conflicts=('hmcl')
source=("git://github.com/huanghongxun/$_pkgname.git"
        "$_pkgname.run")
sha512sums=("SKIP"
            "72d3dc8366c09075ada4eafab977b7c175cf2da6b353e18421b89168044d4f32cd8cd5c5242ba67548b5d415ccc2ea4d81c4909e11407ed1411708e4550d9175")

pkgver() {
    git -C HMCL describe --tag | sed 's/^v//'
}

build() {
    _java=$(ls /usr/lib/jvm | grep -v openjdk | grep java | grep jdk | sort -t - -k 2 -n | tail -n 1)
    export JAVA_HOME=/usr/lib/jvm/$_java
    cd $srcdir/$_pkgname
    sh gradlew build
}

package() {
    _path=$(echo $srcdir/$_pkgname/$_pkgname/build/libs/HMCL*.jar)
    install -Dm644 $_path $pkgdir/usr/share/hmcl/hmcl.jar
    install -Dm755 $srcdir/$_pkgname.run $pkgdir/usr/bin/hmcl
}
