# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=syobon
pkgver=rc1
pkgrel=1
pkgdesc="A free version of the unforgiving Japanese parody of Super Mario Bros"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opensyobon/"
license=('unknown')
depends=(sdl_gfx sdl_image sdl_mixer sdl_ttf)
makedepends=()
source=(syobon
        "http://sourceforge.net/projects/opensyobon/files/src/SyobonAction_rc2_src.tar.gz"
        "http://sourceforge.net/projects/opensyobon/files/src/SyobonAction_rc2_data.tar.gz")
sha256sums=('c749349348357eeca4c9a1e150d5f32a40d5e11517d46840cba0c777fa788885'
            'a61a621de7e4603be047e8666c0376892200f2876c244fb2adc9e4afebc79728'
            '073be7634600df28909701fa132c8e474de1ff9647bf05816f80416be3bcaa9f')

build() {
  cd "$srcdir/src/"
  sed -i 's/gcc/g++/g' "Makefile"
  make
}

package() {
  _data_dirs=(BGM SE res)
  install -Dd -m755 "$pkgdir/usr/share/syobon"
  for _ddir in ${_data_dirs[*]}; do
    cp -r "$srcdir/$_ddir/" "$pkgdir/usr/share/syobon/"
  done
  find "$pkgdir/usr/share/syobon/" -type d -exec chmod 755 "{}" \;
  find "$pkgdir/usr/share/syobon/" -type f -exec chmod 644 "{}" \;
  install -D -m755 "$srcdir/syobon" "$pkgdir/usr/bin/syobon"
  install -D -m755 "$srcdir/src/SyobonAction" "$pkgdir/usr/lib/syobon/syobon"
}

# vim:set ts=2 sw=2 et:
