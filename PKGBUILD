# Maintainer: dctxmei <dctxmei@gmail.com>
pkgname=hmcl-git
_pkgname=HMCL
pkgver=2.0
pkgrel=1
pkgdesc="A powered Minecraft launcher that supports a lot of features."
arch=("x86_64")
url="https://github.com/huanghongxun/HMCL/tree/master"
license=("GPL3")
makedepends=("git")
provides=("hmcl")
conflicts=("hmcl")
source=("git://github.com/huanghongxun/$_pkgname.git#branch=master"
        "https://soft.dct.party/aur/hmcl/jdk-8-linux-x64.tar.xz"
        "hmcl")
sha512sums=("SKIP"
        "SKIP"
        "4f83cd5629ef331f5d172fef3591964ac55da86c529cc7d87be8df63e25a29107773f7a389f83218bd9bd400963d01f9e1495898d9391c7a77042b475ee627cf")

pkgver() {
    git -C $_pkgname describe | sed -e 's/^v//' -e 's/-/./g'
}

build() {
    export JAVA_HOME=$srcdir/jdk1.8.0
    cd $srcdir/$_pkgname
    bash gradlew build
}

package() {
    jpath=$(echo $srcdir/$_pkgname/$_pkgname/build/libs/HMCL-*sources.jar | sed 's/-sources//')
    install -Dm644 $jpath $pkgdir/usr/share/hmcl/hmcl.jar
    mv $JAVA_HOME/jre $pkgdir/usr/share/hmcl/jre
    install -Dm755 $srcdir/hmcl $pkgdir/usr/bin/hmcl
}
