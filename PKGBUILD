# Maintainer: dctxmei <dctxmei@gmail.com>
pkgname=hmcl-git
_pkgname=HMCL
pkgver=3.0
pkgrel=1
pkgdesc="A powered Minecraft launcher that supports a lot of features."
arch=('x86_64')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('jre')
makedepends=("git" "jdk")
provides=('hmcl')
conflicts=('hmcl')
source=("git://github.com/huanghongxun/$_pkgname.git"
        "$_pkgname.run")
sha512sums=("SKIP"
            "1edd383debfde87cede19546391fc6d981e708c8bbe11a46e379e97e6e180235d5087cda8a66973403cc139bec4d75949729f05462d0c5003ae9379b816dcb82")

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
