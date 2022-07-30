# vim: filetype=bash
# Maintainer: amano.kenji <amano.kenji@proton.me>
pkgname=janet-spork
pkgver=0.r2022.07.20
pkgrel=3
pkgdesc="Various Janet utility modules - the official \"Contrib\" library."
arch=("x86_64")
url="https://github.com/janet-lang/spork"
license=("MIT")
depends=("janet-lang")
options=("staticlibs")
_commit="7b51d6243c6bcbec97dbfb77a1bf21edea55c0de"
source=("$pkgname-$pkgver.tar.gz::https://github.com/janet-lang/spork/archive/${_commit}.tar.gz")
sha256sums=('7a0e76fff96a2fa8a5a90e20cc09415068eeb223a7c1ad3b7c8b66c888cee9f3')

build() {
  cd spork-$_commit
  jpm build
}

package() {
  cd spork-$_commit
  install -D -t "${pkgdir}/usr/share/doc/${pkgname}" README.md doc/*
  modpath="$(janet -e '(print (dyn :syspath))')"
  mkdir -p "${pkgdir}/${modpath}"
  jpm --dest-dir="${pkgdir}" --modpath="${modpath}" --binpath="/usr/bin" install
}
