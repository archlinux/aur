# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
pkgname=cpachecker
pkgver=1.9
pkgrel=1
pkgdesc="Tool for configurable software verification."
arch=("x86_64")
url="https://svn.sosy-lab.org/software/cpachecker/trunk"
license=('Apache Version 2.0')
depends=("java-environment" "python" "bash")
makedepends=()
checkdepends=()
conflicts=("cpachecker-svn")
source=("https://cpachecker.sosy-lab.org/CPAchecker-1.9-unix.tar.bz2")
md5sums=("feee336b472cda8e81e70b7b6fa49c6e")
validpgpkeys=()
_dir=CPAchecker-1.9-unix

prepare() {
        cd "$srcdir/$_dir"
        sed '2 i PATH_TO_CPACHECKER=/opt/cpachecker' scripts/cpa.sh > tmpfile
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
