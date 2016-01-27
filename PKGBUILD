# Maintainer: Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
pkgname=eclipse-arm
pkgver=2.11.1
date=201512141335
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
md5sums=('602d7a07c257825f1a889b15fc496338')

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
