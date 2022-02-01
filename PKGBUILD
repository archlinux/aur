schema=sbxlm-sbxh
downloadfile=SbxhPack220128.zip

pkgname=rime-sbxlm-sbxh
pkgver=220128
pkgrel=1
pkgdesc='声笔系列码，声笔小鹤'
arch=(any)
source=("https://gitee.com/sbxlm/sbxlm/attach_files/958324/download/${downloadfile}")
sha256sums=('a17439f7de55d033c727e9b8835d79d4b44a92d0bfc176c15868662391de1ffa')
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
