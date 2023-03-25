# Maintainer: Ruben Bekaert <bekaertruben@gmail.com>

pkgname=amulet-map-editor

pkgdesc="The new age Minecraft world editor and converter that supports every version since Java 1.12 and Bedrock 1.7"
url="https://www.amuletmc.com/"
license=(custom)

arch=(any)
pkgver=0.10.9
pkgrel=1

depends=(python39)

source=(
  amulet.desktop
  icon.png
)

sha256sums=(
  51ada83f17c76a510e129a912555766cf0f7a9fd0351c7a8b219141faeba3aaa
  dcfa7b2bce1cf5b21b219171f727ce3b31cb1290bd28d2b1102cb693bc7629fe
)

prepare() {
  python3.9 -m venv ${srcdir}/venv
  source ${srcdir}/venv/bin/activate
}

build() {
  pip install amulet-map-editor==${pkgver}
  # According to the documentation (https://github.com/Amulet-Team/Amulet-Map-Editor#running-from-source),
  # this is "running from source", hence no -bin suffix in the package name
}

package() {
  mkdir -p ${pkgdir}/opt/amulet ${pkgdir}/usr/share/applications
  cp -r ${srcdir}/venv ${pkgdir}/opt/amulet
  install ${srcdir}/amulet.desktop ${srcdir}/icon.png ${pkgdir}/opt/amulet
  ln -s ${pkgdir}/opt/amulet/amulet.desktop ${pkgdir}/usr/share/applications
}