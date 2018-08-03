# Maintainer: Chris Coggburn <noderat@gmail.com>
pkgname=microsoft-teams
pkgver=0.0.1
pkgrel=3
pkgdesc="Microsoft Teams for Linux Desktop"
arch=('x86_64')
url="https://teams.microsoft.com"
license=('unknown')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('npm')
provides=('microsoft-teams')
source=('microsoft-teams.png'
        'microsoft-teams.desktop'
        'microsoft-teams.sh')

build() {
  cd $srcdir

  npx nativefier https://teams.microsoft.com \
    --name "microsoft-teams" \
    --internal-urls ".*?\.microsoft|okta\.*?" \
    --insecure \
    --honest \
    --tray \
    --ignore-gpu-blacklist \
    --counter \
    --single-instance \
    --always-on-top \
    --electron-version '3.0.0-beta.4' \
    --app-version $pkgver-$pkgrel \
    --icon "$srcdir/$pkgname.png"
  mv $pkgname-*-* microsoft-teams
}

package() {
  install -dm755 "$pkgdir/usr/share/webapps/microsoft-teams"

  install -dm755 "$pkgdir/usr/bin/"
  install -dm755 "$pkgdir/usr/share/pixmaps/"
  install -dm755 "$pkgdir/usr/share/applications/"

  cp -R "$srcdir/$pkgname/." "$pkgdir/usr/share/webapps/microsoft-teams/"
  chmod 755 "$pkgdir/usr/share/webapps/microsoft-teams/resources/app"

  install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/microsoft-teams.png"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

md5sums=('36972d758cfcedc2b1591b46c58e603b'
         'b001e3663f4a0e07123d6192ab9b73c5'
         '2e5967f73064b99f07d865d8fa88e0d6')
sha1sums=('ea8531fdedf49a7da87fa5eeabebb206d254661a'
          'ace7606ebf08386bbe14f380b4dd58b1f06fd78e'
          '354bbc6f3009944e6cc4a4dbb519548cea4034c7')
sha256sums=('7b183bf6a4ff162e90557a7c17fde85ee99d0a3dbfc03298aedbe97e22e127e6'
            '0267ca3650cd42bb8738db02f0f05ff26608969165b16ad751ad3da128ca4791'
            'e2d75632ed4510bcfd4f8f0b504f882616c162c99cb59336254ca2f7784c573c')
sha512sums=('acab74ba4241a9b62c9b24f99bb317fe249931b09e5dc558c43c6fb287eb2cf2ee283e2b365a2e4152e7dda0e1922f1c9bb233b639ee901f44290b01b4b91548'
            '1d9b4e0dc38d9b0db81ec2cce0d1978658f2cf4c02490f29ebb7502ea53eb16750460d36ee804ee3159d6d3b0ddbe4abac0a62a60d841786d0e5e9a69a4f9ee1'
            '9f3e7b4792dd06179f6e321281c8aa2a06d054ff9dfd40c7086a06e2464fb5b356d59dd903d9f6c46af4101bd5efadf02fb95bde90f2df0845e8a64c0cf549ef')

