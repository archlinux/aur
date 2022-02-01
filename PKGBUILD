schema=sbxlm-sbzr
downloadfile=SbzrPack220128.zip

pkgname=rime-sbxlm-sbzr
pkgver=220128
pkgrel=1
pkgdesc='声笔系列码，声笔自然'
arch=(any)
source=("https://gitee.com/sbxlm/sbxlm/attach_files/958326/download/${downloadfile}")
sha256sums=('345b7a10be8cca7880e0b191eaa0223ad38504706793cbc76babd5344e9a56cc')
depends=('rime-sbxlm')
groups=(rime-sbxlm)

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
