# Maintainer: h8ray <gofindme at dmc dot chat>

pkgname=ecss-elph-bin
_pkgname=ecss-elph
pkgver=2.12.2.13
pkgrel=1
pkgdesc="An application to extend the functionality of an ECSS-10 enabled telephone set and use it as a software SIP client"
arch=("x86_64")
url="https://docs.eltex-co.ru/display/doc/Elph+Desktop"
license=("custom")
depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libsecret" "libappindicator-gtk3")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://archive.eltex.org/ssw/jammy/elph/pool/main/e/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=("SKIP")

prepare() {
  tar -xvf data.tar.zst

  sed -i 's/Categories=.*;/Categories=Chat;Network;InstantMessaging;/' "usr/share/applications/${_pkgname}.desktop"
}

package() {
  mv -v "usr/share/doc/${_pkgname}/README.Debian" "usr/share/doc/${_pkgname}/README"

  mkdir -vp "$pkgdir/usr/lib/ecss/${_pkgname}"
  cp -vr --no-preserve=ownership --preserve=mode "usr/lib/ecss/${_pkgname}" "$pkgdir/usr/lib/ecss/"

  mkdir -vp "$pkgdir/usr/share/applications"
  cp -vr --no-preserve=ownership --preserve=mode "usr/share/applications" "$pkgdir/usr/share/"

  mkdir -vp "$pkgdir/usr/share/doc/${_pkgname}"
  cp -vr --no-preserve=ownership --preserve=mode "usr/share/doc/${_pkgname}" "$pkgdir/usr/share/doc/"

  mkdir -vp "$pkgdir/usr/share/icons"
  cp -vr --no-preserve=ownership --preserve=mode "usr/share/icons" "$pkgdir/usr/share/"
}
