pkgname=rime-sbxlm
pkgver=20220201
pkgrel=1
pkgdesc='声笔系列码基础配置，包含声笔简码和声笔拼音'
arch=(any)
source=('https://gitee.com/sbxlm/sbxlm/attach_files/958328/download/Sbxl4Win220201.zip' 'sbxlm-init')
sha256sums=('69ae6e7a6896a1aa764eba6d8178d4a101c78d127f4f02fe19302835f17478af' '496953ce12837de3f575c913a5317996002bcbf8ba2337f697b2efe15d2e0e5e')
optdepends=('librime-sbxlm-git' 'fcitx5-rime')
install=$pkgname.install
groups=(sbxlm)

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
