# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-kde-bin
pkgver=53.0
pkgrel=1
pkgdesc="
'KDE Plasma Edition' of the free, open and private browser. It contains KDE patches (which contains KDE file dialogs, file associations, protocol handlers and other KDE Plasma integration features) and other useful patches."
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('alsa-lib' 'libxt' 'mime-types' 'dbus-glib' 'hunspell' 'gtk2' 'gtk3' 'nss' 'kwaterfoxhelper')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
conflicts=('waterfox-bin' 'waterfox-git')
options=('!emptydirs' '!strip')

source=("waterfox-kde_${pkgver}_amd64.deb::https://hawkeye116477.github.io/waterfox-deb/pool/main/w/waterfox-kde/waterfox-kde_${pkgver}_amd64.deb"
"waterfox-locales-${pkgver}.7z::https://github.com/hawkeye116477/waterfox-deb/raw/aur/waterfox-locales-${pkgver}.7z"
)

# Don't extract anything
noextract=(${source[@]%%::*})

package() {
  msg2 "Extracting waterfox-kde_${pkgver}_amd64.deb..."
  bsdtar -xf waterfox-kde_${pkgver}_amd64.deb
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  msg2 "Extracting waterfox-locales-${pkgver}.7z..."
  bsdtar -xf waterfox-locales-${pkgver}.7z -C "$pkgdir/opt/waterfox/browser/features"
  msg2 "Creating symlinks..."
  # Use system-provided dictionaries. Hunspell symlink is in deb.
  ln -Ts /usr/share/hyphen "$pkgdir/opt/waterfox/hyphenation"
}

sha256sums=('13cd27da05ed7acffb174382d9cc0cd133c37e7fccef8ed2fd7234f10f1ddfb1'
            '00802e3e70dd679c5574bc1bc8b1a73a2f49101d4f20cbf25a7bb3148aae7212')
