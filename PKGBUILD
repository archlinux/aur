# Maintainer: mark.blakeney at bullet-systems dot net
# Original Maintainer: Jameson Pugh <imntreal@gmail.com>

_pkgname=skypeforlinux
pkgname="$_pkgname-preview-bin"
pkgver=8.109.76.210
pkgrel=1
pkgdesc="Skype for Linux - Preview/Insider Version"
arch=("x86_64")
url="http://www.skype.com"
license=("custom")
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss"
         "glibc>=2.28-4")
optdepends=("org.freedesktop.secrets: keyring/password support"
            "libappindicator-gtk3: systray icon support")
conflicts=("$_pkgname" "$_pkgname-stable-bin" "skype")
provides=("$_pkgname" "skype")
install="$pkgname-install"
# We embed the pkgrel in the download file name because skype devs
# sometimes use the same version number for an update and any previously
# cached file will otherwise fail against the new checksum.
source=(
"${_pkgname}_${pkgver}_${pkgrel}_amd64.deb::https://repo.skype.com/deb/pool/main/s/$_pkgname/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('1a882a6be81a2010eb8a167c143e44b253aafbc2a4aa801014e4192d06b32b9d')

package() {
  tar --no-same-owner -xC "$pkgdir" -f data.tar.gz
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/$_pkgname/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir/opt"
}

# vim:set ts=2 sw=2 et:
