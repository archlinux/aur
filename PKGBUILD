# Maintainer: Philip May <eniak.info@gmail.com>
# Contributor: mark blakeney at bullet dash systems dot net
_appname=pycharm
pkgname="$_appname-community-jre"
pkgver=2025.3
pkgrel=1
pkgdesc="PyCharm Community Edition IDE for Python with bundled JRE"
arch=(x86_64 aarch64)
url="https://www.jetbrains.com/pycharm/"
license=('Apache-2.0')
conflicts=(
  "pycharm-community-eap"
  "pycharm-community-edition"
)
source=(
  pycharm.desktop
  pycharm.sh
)

source_x86_64=("https://download.jetbrains.com/python/pycharm-${pkgver}.tar.gz")
source_aarch64=("https://download.jetbrains.com/python/pycharm-${pkgver}-aarch64.tar.gz")

options=(!strip)
sha256sums=('f727119ec7c8b96820e80712b1ee342de6a94ff72402e8f2d390cbff702f9b21'
            '81005f7c292a59ebfe0b0905e4dc90c0fa35b491465fde063ccf583860ba33b1')
sha256sums_x86_64=('a410c9c5834ede16373325ea21b850e309557db5d9dcca3674caf92ea7c5bf05')
sha256sums_aarch64=('97f00b722caba564eaf4eda35bb3344a92f3bd76e798ea58e65f45efa4054e14')

package() {
  cd "${_appname}-${pkgver}"

  # workaround FS#40934
  # see https://bugs.archlinux.org/task/40934
  sed -i 's/lcd/on/' bin/*.vmoptions

  rm -rf bin/fsnotifier-arm

  install -dm 755 "${pkgdir}"/usr/share/{licenses,pixmaps,pycharm}
  cp -dr --no-preserve='ownership' bin help jbr lib modules plugins \
    product-info.json "${pkgdir}"/usr/share/pycharm/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/pycharm/
  cp -dr --no-preserve='ownership' bin/pycharm.png "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 ../pycharm.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 755 ../pycharm.sh "${pkgdir}"/usr/bin/pycharm
}
