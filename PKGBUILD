schema=sbxlm-sbkm
downloadfile=声笔快码扩展包20220202.zip

pkgname=rime-sbxlm-sbkm
pkgver=20220202
pkgrel=1
pkgdesc='声笔系列码，声笔快码'
arch=(any)
source=("https://gitee.com/sbxlm/sbxlm/attach_files/958466/download/${downloadfile}")
sha256sums=('8d3875d4585a6eb51cb30b45ede25e759b5819ab6efc1fda15c2f28f9a47339f')
depends=('rime-sbxlm')
groups=(sbxlm)

prepare () {
  cd $srcdir
  tar czf $srcdir/$schema.tar.gz *.userdb
  rm -rf *.userdb $downloadfile
  sed -i 's/import_preset: symbols/import_preset: sbxlm-symbols/g' *.schema.yaml
}

package() {
  mkdir -p $pkgdir/usr/share/sbxlm/init-userdb
  cp $srcdir/$schema.tar.gz $pkgdir/usr/share/sbxlm/init-userdb
  cp -r $srcdir/ $pkgdir/usr/share/rime-data/
  chmod 755 $pkgdir/usr/share/rime-data/
}
