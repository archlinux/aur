pkgname=rime-sbxlm
pkgver=20220201
pkgrel=1
pkgdesc='声笔系列码基础配置，包含声笔简码和声笔拼音'
arch=(any)
source=('https://gitee.com/sbxlm/sbxlm/attach_files/958328/download/Sbxl4Win220201.zip' 'sbxlm-init')
sha256sums=('69ae6e7a6896a1aa764eba6d8178d4a101c78d127f4f02fe19302835f17478af' '975a919b0cd6be791672e335ff849b1cb4aaf3a6030af38aeb5789ffb5c5a017')
optdepends=('librime-sbxlm-git' 'fcitx5-rime')

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

post_install() {
 echo '执行命令 sbxlm-init 初始化 rime 配置'
}
