# Maintainer: Dimio <dimio at dimio dot org>

_appname=openide
pkgname="$_appname-bin"
pkgver=253.28294.334.7
pkgrel=1
pkgdesc="OpenID is an open source software development tool for Java, Python, and other programming languages. It was created by the Astra Group, Haulmont, and Axiom JDK companies. It is fork of pycharm"
arch=(x86_64)
url="https://openide.ru"
license=('AGPL-3.0-or-later')
conflicts=(
  "openide"
)
source=(
  openide.desktop
  openide.sh
)

install=openide.install

source_x86_64=("https://download.openide.ru/${pkgver}/openIDE-${pkgver}.tar.gz")

options=(!strip)
sha256sums=('aa3e4f48f311c7b9368c878c05ff6b93672ab6da56bd60aba1109c118e7cbed5'
            '5df2ba94996f8e7bdcde97c9b60aef128c65f5308775b02ea7df41395523c88f')
sha256sums_x86_64=('1b7d152b06a0b6094f29c16fe801152487f88c4c02a6cce5cc0f6addbe34c849')

package() {
  cd ""openIDE-${pkgver}""

  # workaround FS#40934
  # see https://bugs.archlinux.org/task/40934
  sed -i 's/lcd/on/' bin/*.vmoptions

  rm -rf bin/fsnotifier-arm

  install -dm 755 "${pkgdir}"/usr/share/{licenses,pixmaps,openide}
  cp -dr --no-preserve='ownership' bin jbr lib modules plugins \
    product-info.json "${pkgdir}"/usr/share/openide/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/openide/
  cp -dr --no-preserve='ownership' bin/openide.png "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 ../openide.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 755 ../openide.sh "${pkgdir}"/usr/bin/openide
}
