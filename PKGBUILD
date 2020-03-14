# Maintainer: Philip May <eniak.info@gmail.com>
pkgname=pycharm-community-jre
_appname=pycharm-community
pkgver=2019.3.3
pkgrel=2
pkgdesc="PyCharm Community Edition IDE for Python with bundled JRE"
arch=(x86_64)
url="https://www.jetbrains.com/pycharm/"
license=('APACHE')
conflicts=(
  "pycharm-community-eap"
  "pycharm-community-edition"
)
source=(
  "https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz"
  pycharm.desktop
  pycharm.sh
)
noextract=()
md5sums=(
  'c146b22111320c5b09915ba712abb813'
  'fc1d48c63947aaa9cee5d5fdc1fa47ec'
  'ce132aabec45ff9c17eaa7d43c4d399d'
)

package() {
  cd "${_appname}-${pkgver}"

  # workaround FS#40934
  # see https://bugs.archlinux.org/task/40934
  sed -i 's/lcd/on/' bin/*.vmoptions

  rm -rf bin/fsnotifier{,-arm}

  install -dm 755 "${pkgdir}"/usr/share/{licenses,pixmaps,pycharm}
  cp -dr --no-preserve='ownership' bin index jbr lib plugins "${pkgdir}"/usr/share/pycharm/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/pycharm/
  ln -s /usr/share/pycharm/bin/pycharm.png "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 ../pycharm.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 755 ../pycharm.sh "${pkgdir}"/usr/bin/pycharm
}
