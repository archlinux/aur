# Maintainer: Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
pkgname=eclipse-arm
pkgver=2.8.1
date=201504061754
pkgrel=2
pkgdesc="GNU ARM Eclipse Plug-in"
arch=('any')
url="http://sourceforge.net/projects/gnuarmeclipse"
install="eclipse-arm.install"
license=("GPL")
options=('!strip')
depends=('eclipse-cpp')
source=("http://sourceforge.net/projects/gnuarmeclipse/files/Current%20Releases/2.x/ilg.gnuarmeclipse.repository-$pkgver-$date.zip")
md5sums=('08b62e19361d99c20c383c00bfba82ea')

package() {
  _dest="${pkgdir}/usr/share/eclipse/dropins/arm/eclipse"

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
