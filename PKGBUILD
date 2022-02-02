schema=sbxlm-sbfm
downloadfile=声笔飞码扩展包20220202.zip

pkgname=rime-sbxlm-sbfm
pkgver=20220202
pkgrel=1
pkgdesc='声笔系列码，声笔飞码'
arch=(any)
source=("https://gitee.com/sbxlm/sbxlm/attach_files/958465/download/${downloadfile}")
sha256sums=('ee8e3367f2f86694a08327e6dffa279024fd48f9a7ca86228b48633c0e274cca')
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
