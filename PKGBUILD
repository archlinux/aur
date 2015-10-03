# Maintainer: Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
pkgname=eclipse-arm
pkgver=2.9.3
date=201508190739
pkgrel=1
pkgdesc="GNU ARM Eclipse Plug-in"
arch=('any')
url="http://gnuarmeclipse.github.io"
install="eclipse-arm.install"
license=("GPL")
options=('!strip')
depends=('eclipse-cpp')
source=(#"http://sourceforge.net/projects/gnuarmeclipse/files/Current%20Releases/2.x/ilg.gnuarmeclipse.repository-$pkgver-$date.zip"
        "https://github.com/gnuarmeclipse/plug-ins/releases/download/v$pkgver-$date/ilg.gnuarmeclipse.repository-$pkgver-$date.zip")
md5sums=('5a76d4dfa6d32f15a4495fef1476a8ce')

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/arm/eclipse"

  cd "${srcdir}"
  mkdir -p "$_dest"
  # Features
  for _f in features/*.jar; do
    _dir="${_dest}/${_f/.jar}"
    mkdir -p "${_dir}"
    bsdtar -xf "${_f}" -C "${_dir}"
  done

  # Plugins
  for _p in plugins/*.jar; do
    install -Dm644 "${_p}" "${_dest}/${_p}"
  done

}
