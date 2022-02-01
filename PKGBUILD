schema=sbxlm-sbkm
downloadfile=SbkmPack220124.zip

pkgname=rime-sbxlm-sbkm
pkgver=220124
pkgrel=1
pkgdesc='声笔系列码，声笔快码'
arch=(any)
source=("https://gitee.com/sbxlm/sbxlm/attach_files/958329/download/${downloadfile}")
sha256sums=('c80cbf86a23ff4b244c6a5434223a609ef7a1a251649c0cd56703f2c0be95438')
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
