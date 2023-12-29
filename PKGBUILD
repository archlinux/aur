# Maintainer: Philip May <eniak.info@gmail.com>
# Contributor: mark blakeney at bullet dash systems dot net
_appname=pycharm-community
pkgname=$_appname-jre
pkgver=2023.3.2
pkgrel=1
pkgdesc="PyCharm Community Edition IDE for Python with bundled JRE"
arch=(x86_64 aarch64)
url="https://www.jetbrains.com/pycharm/"
license=('APACHE')
conflicts=(
  "pycharm-community-eap"
  "pycharm-community-edition"
)
source=(
  pycharm.desktop
  pycharm.sh
)
options=(!strip)
sha256sums=('f727119ec7c8b96820e80712b1ee342de6a94ff72402e8f2d390cbff702f9b21'
            'b6f0518e59c4744ded38de63efba91205bcba406fa74944a1f3a8937566d8acc')
sha256sums_x86_64=('1a4a95648c68890f2f9eb41cbb9eb041dcd08388c75a91298dfbe73f83a858c8')
sha256sums_aarch64=('1d63c0ea7dec718f67ad78e0ccef76058d92f63d07afe931a4ac6ff3f74c9052')

source_x86_64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz")

source_aarch64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}-aarch64.tar.gz")

package() {
  cd "${_appname}-${pkgver}"

  # workaround FS#40934
  # see https://bugs.archlinux.org/task/40934
  sed -i 's/lcd/on/' bin/*.vmoptions

  rm -rf bin/fsnotifier-arm

  install -dm 755 "${pkgdir}"/usr/share/{licenses,pixmaps,pycharm}
  cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}"/usr/share/pycharm/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/pycharm/
  ln -s /usr/share/pycharm/bin/pycharm.png "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 ../pycharm.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 755 ../pycharm.sh "${pkgdir}"/usr/bin/pycharm
}
