# Maintainer : yaute <yaute74@gmail.com>

pkgname=hattrick_organizer-git
pkgver=1.436.0
pkgrel=1
_rel=1.436.0.102
pkgdesc="A manager assistent for the online football manager Hattrick "
arch=(i686 x86_64)
url="https://github.com/akasolace/HO"
license=(GPL)
depends=(java-runtime)
makedepends=(libarchive)
source=(https://github.com/akasolace/HO/releases/download/dev/ho_$_rel.deb)

md5sums=('7adb743fc43d762201c2bdce9fa67549')

package() {
desktopfile=$pkgdir/usr/share/applications/ho.desktop
desktopfile_git=$pkgdir/usr/share/applications/ho-git.desktop
libpath=$pkgdir/usr/lib/ho
libpath_git=$pkgdir/usr/lib/ho-git
shellfile=$pkgdir/usr/bin/ho.sh
shellfile_git=$pkgdir/usr/bin/ho-git.sh

cd $srcdir
bsdtar xf  ho_$_rel.deb || return 1
bsdtar xf data.tar.gz -C $pkgdir || return 1
sed -i "s|Name=HattrickOrganizer.*|Name=HattrickOrganizer beta ${pkgver}|" $desktopfile
sed -i "s|/usr/lib/ho|/usr/lib/ho-git|" $desktopfile
sed -i "s|/usr/bin/ho|/usr/bin/ho-git|" $desktopfile
sed -i "s|/.ho|/.ho-git|" $shellfile
sed -i "s|/usr/lib/ho|/usr/lib/ho-git|" $shellfile

mv $libpath $libpath_git
mv $desktopfile $desktopfile_git
mv $shellfile $shellfile_git
ln -s /usr/bin/ho-git.sh $pkgdir/usr/bin/ho-git
rm $pkgdir/usr/bin/ho
}

