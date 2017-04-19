# Maintainer: Sotirios M. Roussis (xToNouSou) <xtonousou@gmail.com>

_pkgname=airgeddon
pkgname=$_pkgname-git
pkgver=r590.6e8dd63
pkgrel=6.2
pkgdesc='This is a multi-use bash script for Linux systems to audit wireless networks'
url='https://github.com/v1s1t0r1sh3r3/airgeddon'
license=('GPL3')
source=('git://github.com/v1s1t0r1sh3r3/airgeddon.git')
depends=(
  'net-tools'
  'iw'
  'aircrack-ng'
  'wireless_tools'
  'gawk'
  'xterm'
  'coreutils'
  'sed'
)
optdepends=(
  'curl: for self-updating and WPS pin database updating'
	'xorg-xdpyinfo: for printing better on windows'
  'ethtool: to get device information'
  'pciutils: to get device information'
  'rfkill: for enabling and disabling wireless devices'
)
makedepends=('git' 'coreutils' 'sed')
conflicts=('airgeddon-git')
provides=('airgeddon-git')
sha256sums=('SKIP')
arch=('any')

prepare() {
  if [ -d "$srcdir/${pkgname}" ]; then
    rm -rf "$srcdir/${pkgname}"
  fi

  mkdir -p "$srcdir/${pkgname}"
  cd "$srcdir/${pkgname}"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "$pkgdir/usr/local/bin"
  install -Dm755 airgeddon.sh "$pkgdir/usr/local/bin/airgeddon"
  install -Dm755 language_strings.sh "$pkgdir/usr/local/bin/language_strings.sh"
  install -Dm755 known_pins.db "$pkgdir/usr/local/bin/known_pins.db"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=2 sw=2 et:
