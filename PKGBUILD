# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgbase=arlequin
pkgname=('arlecore' 'arlsumstat' 'arlequin-extra')
pkgver=3.5.2.2
pkgrel=5
arch=('any')
url="http://cmpg.unibe.ch/software/arlequin${pkgver//./}"
license=('custom')
depends=('glibc')
source=("$url/linux/arlecore_linux.zip"
	"$url/linux/arlsumstat_linux.zip"
	"$url/linux/Example%20files_linux.zip")
sha256sums=('79d7ce0c126c32f88a66290aabd29e0b2e5b2d8c46cbcf02ef95ac7cbb91ead8'
            '709590b42d1ad5060cce4d90debe4ef2b9c0d1986f3d8dffd80c7b694d0ff454'
            '58e76d888ff2f4631df2ac482dd1e3c44cda389f9c31f7512993a852610cd985')
pkg1=arlecore 
pkg2=arlsumstat
package_arlecore() {
  pkgdesc="console version of of Arlequin: An Integrated Software for Population Genetics Data Analysis"
  arch=('x86_64')
  install -Dm 755 $srcdir/${pkg1}_linux/${pkg1}${pkgver//./}_64bit $pkgdir/usr/bin/$pkg1
}
package_arlsumstat() {
  pkgdesc="a modified version of Arlequin for computing summary statistics"
  arch=('x86_64')
  install -Dm 755 $srcdir/${pkg2}_linux/${pkg2}${pkgver//./}_64bit $pkgdir/usr/bin/$pkg2
}
package_arlequin-extra(){
  pkgdesc="extra files for arlequin"
  arch=('any')
  # scripts
  cd $srcdir/'Example files_linux'
  install -dm 755 $pkgdir/usr/share/$pkgbase
  cp -r * $pkgdir/usr/share/$pkgbase/

  # pkg1
  cd $srcdir/${pkg1}_linux/
for pdf in $(ls *.pdf)
do
  install -Dm 755 $pdf $pkgdir/usr/share/$pkgbase/Arlequin.pdf
done
  install -Dm 755 ${pkg1}_readme.txt $pkgdir/usr/share/$pkgbase/${pkg1}_readme.txt
  install -Dm 755 arl_run.ars $pkgdir/usr/share/$pkgbase/$pkg1.arl_run.ars

  # pkg2
  cd $srcdir/${pkg2}_linux/
  install -Dm 755 ${pkg2}_readme.txt $pkgdir/usr/share/$pkgbase/${pkg2}_readme.txt
  install -Dm 755 arl_run.ars $pkgdir/usr/share/$pkgbase/$pkg2.arl_run.ars
  install -Dm 755 ssdefs.txt $pkgdir/usr/share/$pkgbase/ssdefs.txt
}
