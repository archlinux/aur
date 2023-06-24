# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
pkgname=cpachecker
pkgver=2.2
pkgrel=3
pkgdesc="Tool for configurable software verification."
arch=("x86_64")
url="https://svn.sosy-lab.org/software/cpachecker/trunk"
license=('Apache Version 2.0')
depends=("java-environment=17" "python" "bash" "jre-openjdk")
makedepends=()
checkdepends=()
conflicts=("cpachecker-svn")
source=("https://cpachecker.sosy-lab.org/CPAchecker-2.2-unix.zip")
md5sums=("90a858f808b708fd161e12cf8f1b460e")
validpgpkeys=()
_dir=CPAchecker-2.2-unix

prepare() {
        cd "$srcdir/$_dir"
        sed '2 i PATH_TO_CPACHECKER=/opt/cpachecker\nJAVA_HOME=/usr/lib/jvm/java-11-openjdk/jre\nPATH=${JAVA_HOME}/bin:$PATH' scripts/cpa.sh > tmpfile
        mv tmpfile scripts/cpa.sh
        chmod +x scripts/cpa.sh
}

package() {
        cd "$srcdir/$_dir"
        mkdir -p "$pkgdir"/opt/cpachecker
        cp -r "$srcdir/$_dir"/. "$pkgdir"/opt/cpachecker/
        mkdir -p "$pkgdir"/usr/bin
        cp "$srcdir/$_dir"/scripts/cpa.sh "$pkgdir"/usr/bin/cpachecker
        chmod +xr "$pkgdir"/usr/bin/cpachecker        
        chmod 755 -R "$pkgdir"/opt/cpachecker/
}
