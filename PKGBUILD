pkgname=rime-sbxlm
pkgver=20220201
pkgrel=1
arch=(any)
source=('https://gitee.com/sbxlm/sbxlm/attach_files/958328/download/Sbxl4Win220201.zip' 'sbxlm-init')
sha256sums=('69ae6e7a6896a1aa764eba6d8178d4a101c78d127f4f02fe19302835f17478af' '60aae38f7e58fcef75f5c3e3a2fe75ec3fed6529bdea9f16c4b3e20a8148f4db')
prepare () {
  cd $srcdir/sbxlm
  mv symbols.yaml sbxlm-symbols.yaml
  tar czf $srcdir/sbxlm-init-userdb.tar.gz *.userdb
  rm -rf *.userdb
  sed -i 's/import_preset: symbols/import_preset: sbxlm-symbols/g' *.schema.yaml
}

package() {
  mkdir -p $pkgdir/usr/share/sbxlm
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/sbxlm-init-userdb.tar.gz $pkgdir/usr/share/sbxlm/
  cp -r $srcdir/sbxlm/ $pkgdir/usr/share/rime-data/
  cp sbxlm-init $pkgdir/usr/bin
  chmod 755 $pkgdir/usr/share/rime-data/
}
