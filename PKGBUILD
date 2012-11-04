# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=syobon
pkgver=0.0.0
pkgrel=1
pkgdesc="A mario clone that aims to be annoying"
arch=('i686' 'x86_64')
url="http://www.geocities.jp/z_gundam_tanosii/home/Main.html"
license=('unknown')
depends=(wine)
makedepends=(unzip)
source=(syobon "http://www.geocities.jp/z_gundam_tanosii/home/syobon-action.zip")
sha256sums=('f63404733a341d5d381502bdea68ff1637d20e488bd09c50595b52efe391aded'
            'df0d9505f6798a66bee1334d848e8b2f7d5542bdedbeb1004278e21a85b013ef')



build() {
  #cleaning up the messy names
  _strange_name=$'\202\265\202\345\202ڂ\361\202̃A\203N\203V\203\207\203\223'
  rm -rf "$srcdir/syobon-dir/"
  mv "$srcdir/$_strange_name/" "$srcdir/syobon-dir/"
  mv "$srcdir/syobon-dir/$_strange_name.exe" "$srcdir/syobon-dir/syobon"
  rm "$srcdir/syobon-dir/SE/gameove"$'\202\222.mp3'
}

check() {
  sleep 1
}

package() {
  _data_dirs=(BGM SE res)
  install -Dd -m755 "$pkgdir/usr/share/syobon"
  for _ddir in ${_data_dirs[*]}; do
    cp -r "$srcdir/syobon-dir/$_ddir/" "$pkgdir/usr/share/syobon/"
  done
  find "$pkgdir/usr/share/syobon/" -type d -exec chmod 755 "{}" \;
  find "$pkgdir/usr/share/syobon/" -type f -exec chmod 644 "{}" \;
  install -d -m755 "$pkgdir/usr/bin"
  install -D -m755 "$srcdir/syobon" "$pkgdir/usr/bin"
  install -D -m755 "$srcdir/syobon-dir/syobon" "$pkgdir/usr/share/syobon/syobon"
}

# vim:set ts=2 sw=2 et:
