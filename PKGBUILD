# vim: filetype=bash
# Maintainer: amano.kenji <amano.kenji@proton.me>
pkgname=simple-dosbox-launcher
pkgver=0.1.5
pkgrel=1
pkgdesc="It launches an executable in an archive file with dosbox."
arch=("x86_64")
url="https://codeberg.org/amano.kenji/simple-dosbox-launcher"
license=("0BSD")
depends=("janet-spork" "janet-sh" "coreutils"
  "atool" "unionfs-fuse" "dosbox")
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/amano.kenji/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('92861707fc08794484b703f9cac37a45ab5114d0509195a1940fdd1cada76b9b')

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
