# vim: filetype=bash
# Maintainer: amano.kenji <amano.kenji@proton.me>
pkgname=simple-dosbox-launcher
pkgver=0.1.3
pkgrel=1
pkgdesc="It launches an executable in an archive file with dosbox."
arch=("x86_64")
url="https://codeberg.org/amano.kenji/simple-dosbox-launcher"
license=("custom:LICENSE")
depends=("janet-spork" "janet-sh" "coreutils"
  "atool" "unionfs-fuse" "dosbox")
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/amano.kenji/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3a13b64de3542e99d11b58581e92f78d13db111cb36a3b82db2e8e9882e7832d')

build() {
  cd ${pkgname}
  jpm build
}

package() {
  cd ${pkgname}
  install -D -t "${pkgdir}/usr/share/doc/${pkgname}" README.adoc
  install -D -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  modpath="$(janet -e '(print (dyn :syspath))')"
  mkdir -p "${pkgdir}/${modpath}"
  jpm --dest-dir="${pkgdir}" --modpath="${modpath}" --binpath="/usr/bin" install
}
