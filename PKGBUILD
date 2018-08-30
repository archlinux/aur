# Maintainer: dctxmei <dctxmei@gmail.com>
pkgname=hmcl-git
_pkgname=HMCL
pkgver=3.0
pkgrel=1
pkgdesc="A powered Minecraft launcher that supports a lot of features."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('java-openjfx>=8')
makedepends=("git" "jdk")
provides=('hmcl')
conflicts=('hmcl')
source=("git://github.com/huanghongxun/$_pkgname.git"
        "$_pkgname.run")
sha512sums=("SKIP"
            "a9277570636161664a4d4b5c7cef7ff029e9dcccd2c36372c1294fc41cfec3c63a4be3e0f6c0acff79020f6a087d40b41c2463bce0acb16c866dfa7f9c0d533a")

pkgver() {
    git -C HMCL describe --tag | sed 's/^v//'
}

build() {
    _java=$(ls /usr/lib/jvm | grep java | grep jdk | sort -t - -k 2 -n | tail -n 1)
    export JAVA_HOME=/usr/lib/jvm/$_java
    cd $srcdir/$_pkgname
    sh gradlew build
}

package() {
    _path=$(echo $srcdir/$_pkgname/$_pkgname/build/libs/HMCL*.jar)
    install -Dm644 $_path $pkgdir/usr/share/hmcl/hmcl.jar
    install -Dm755 $srcdir/$_pkgname.run $pkgdir/usr/bin/hmcl
}
