# Maintainer: witt <1989161762 at qq dot com>

pkgname=pycharm-community-edition-bin
_pkgname=${pkgname%-bin}
pkgrel=1
pkgver=2025.1.2
arch=('x86_64' 'aarch64')
pkgdesc="The IDE for Pure Python Development."
url="https://www.jetbrains.com/pycharm/"
license=('Apache-2.0')
options=(!strip)
conflicts=(
  "pycharm-community-eap"
  "pycharm-community-edition"
  "pycharm-community-jre"
)
provides=('pycharm-community-edition' 'pycharm-community')
backup=("opt/${_pkgname}/bin/pycharm64.vmoptions" "opt/${_pkgname}/bin/idea.properties")
depends=('giflib' 'libxtst' 'libxrender')
optdepends=(
  'libdbusmenu-glib: For global menu support'
)
# 警告: “download.clf.jetbrains.com.cn” 的证书不可信。
DLAGENTS=("https::/usr/bin/wget -U 'Mozilla' --no-check-certificate -O %o %u")
source=(
  "${_pkgname}.desktop"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/JetBrains/intellij-community/refs/heads/master/LICENSE.txt"
)
source_x86_64=("pycharm-community-${pkgver}_x86_64.tar.gz::https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz")
source_aarch64=("pycharm-community-${pkgver}-aarch64.tar.gz::https://download.jetbrains.com/python/pycharm-community-${pkgver}-aarch64.tar.gz")
sha256sums=('67649e0494e3f216982a97e4c9549257a756182dc44f5455c5497a9688373141'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('193fbbb638235c4c671bb6c6b432f43a2d46f7f7ebd6b5f2cc8a1db7db93c5d6')
sha256sums_aarch64=('10e7426804d649d3c5bdbfc365cf85fe73dd7e74e67fd1e4c82645e8532d17e7')

package() {
  install -d "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  mv "pycharm-community-${pkgver}"/* "$pkgdir/opt/${_pkgname}"

  ln -s "/opt/$_pkgname/bin/pycharm" "$pkgdir/usr/bin/$_pkgname"
  install -D -m644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "$pkgdir/opt/${_pkgname}/bin/pycharm.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir/opt/$_pkgname/bin/"*.vmoptions
}

# vim:set ts=2 sw=2 et:
