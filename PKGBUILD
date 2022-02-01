schema=sbxlm-sbfm
downloadfile=SbfmPack220124.zip

pkgname=rime-sbxlm-sbfm
pkgver=220124
pkgrel=1
pkgdesc='声笔系列码，声笔飞码'
arch=(any)
source=("https://gitee.com/sbxlm/sbxlm/attach_files/958327/download/${downloadfile}")
sha256sums=('4abf3fee3e12f3c135159e5d11f63c4948311941dd480017a9de621ccb7978e4')
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
