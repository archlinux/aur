# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=doom3-phantasm
pkgver=1.2
pkgrel=5
pkgdesc="A Doom 3 mod based on the Phantasm horror movies"
arch=(i686 x86_64)
url="http://doom3.filefront.com/file/Phantasm_D3;72040"
license=('custom:doom3-phantasm')
depends=('doom3')
makedepends=('unzip')
source=(ftp://files.mhgaming.com/doom3/mods/phantasm_d3_${pkgver}.zip
        http://ducttape.glenmurphy.com/ducttape0006.zip
        doom3-phantasm.sh
        doom3-phantasm.desktop)
md5sums=('e7ec9729b3a90e29b7ccdda94d9e3463'
         'b890d978f3bc5b5c8ecbe52e4934e368'
         'ccfbd73953c480c86bb0b2a6eef0f05f'
         '0efbe5d6d7937f1bb275cc908e2ee361')

build() {
  cd $startdir/src/phantasm_d3

  mkdir -p $startdir/pkg/{opt/doom3/phantasm,usr/share/licenses/$pkgname}
  cp -r config.spec description.txt guis phantasma.pk4 $startdir/pkg/opt/doom3/phantasm/ || return 1
  install -m644 ../pak008.pk4 $startdir/pkg/opt/doom3/phantasm/pak999.pk4 || return 1
  install -m755 -D ../$pkgname.sh $startdir/pkg/usr/bin/$pkgname || return 1

  # Extract custom license
  sed -n 107,120p "phantasm_d3_${pkgver}  readme.txt" | sed 's|^ *||g' \
    > $startdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1

  # Desktop entry
  install -D -m644 $startdir/src/$pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop || return 1
}
