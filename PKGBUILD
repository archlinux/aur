# Maintainer: Philip May <eniak.info@gmail.com>
# Contributor: mark blakeney at bullet dash systems dot net
_appname=pycharm-community
pkgname="$_appname-jre"
pkgver=2025.1.2
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

source_x86_64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz")
source_aarch64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}-aarch64.tar.gz")

options=(!strip)
sha256sums=('f727119ec7c8b96820e80712b1ee342de6a94ff72402e8f2d390cbff702f9b21'
            '81005f7c292a59ebfe0b0905e4dc90c0fa35b491465fde063ccf583860ba33b1')
sha256sums_x86_64=('193fbbb638235c4c671bb6c6b432f43a2d46f7f7ebd6b5f2cc8a1db7db93c5d6')
sha256sums_aarch64=('10e7426804d649d3c5bdbfc365cf85fe73dd7e74e67fd1e4c82645e8532d17e7')

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
