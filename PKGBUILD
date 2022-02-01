pkgname=rime-sbxlm
pkgver=20220201
pkgrel=1
pkgdesc='声笔系列码基础配置，包含声笔简码和声笔拼音'
arch=(any)
source=('https://gitee.com/sbxlm/sbxlm/attach_files/958328/download/Sbxl4Win220201.zip' 'sbxlm-init')
sha256sums=('69ae6e7a6896a1aa764eba6d8178d4a101c78d127f4f02fe19302835f17478af' 'b4935c29f55bad2b768339b7a79608d474caf7e2b2389eca0b7102d593e04a95')
optdepends=('librime-sbxlm-git' 'fcitx5-rime')
install=$pkgname.install

prepare () {
  cd $srcdir/sbxlm
  mv symbols.yaml sbxlm-symbols.yaml
  tar czf $srcdir/sbxlm.tar.gz *.userdb
  rm -rf *.userdb
  sed -i 's/import_preset: symbols/import_preset: sbxlm-symbols/g' *.schema.yaml
}

package() {
  mkdir -p $pkgdir/usr/share/sbxlm/init-userdb
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/sbxlm.tar.gz $pkgdir/usr/share/sbxlm/init-userdb
  cp -r $srcdir/sbxlm/ $pkgdir/usr/share/rime-data/
  cp sbxlm-init $pkgdir/usr/bin
  chmod 755 $pkgdir/usr/share/rime-data/
}
