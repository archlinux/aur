pkgname=graphicsmagick-imagemagick-compat
pkgver=1.0
pkgrel=1
pkgdesc="Image processing tools providing ImageMagick interface"
arch=(any)
url="http://packages.debian.org/sid/graphicsmagick-imagemagick-compat"
license=('custom')
depends=(graphicsmagick)
provides=(imagemagick)
conflicts=(imagemagick)
source=(
  animate.1.gz
  compare.1.gz
  composite.1.gz
  conjure.1.gz
  convert.1.gz
  display.1.gz
  identify.1.gz
  import.1.gz
  mogrify.1.gz
  montage.1.gz
  )
noextract=(${source[@]%%::*})
md5sums=('66bf582fb03185701fe23968cb0403b2'
         'afc8645338917aca95fa1a35a7a7c759'
         'a064db2625168a344c39485a720bb3e0'
         '1e3b5574e45e1a771b6d53d28320961f'
         'a2aa4852b7c8a9ba84c7d9c4706d316b'
         'bc84503413494192d567d9e7bb470fc7'
         '08bb2481e47c90dc5544766583aad8a6'
         '2ca57b1ef07020c4f670f602fade40a3'
         '2dc737956df869a1d24966f8ed5f9801'
         '400adf9bd9845e94f30729312bd2c8e0')

package() {
  cd "${srcdir}"

  GM="$(which gm)"
  BIN="${pkgdir}/usr/bin"
  install -dm 755 "${BIN}"
  # create symlinks to gm
  for i in *.1.gz
  do
    ln -s ${GM} "${BIN}/${i%.1.gz}"
  done

  MAN="${pkgdir}/usr/share/man/man1"
  install -dm 755 "${MAN}"
  # install separate man-pages
  for i in *.1.gz
  do
    install -m 644 ${i} "${MAN}"
  done
}

# vim:set ts=2 sw=2 et:
