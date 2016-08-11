# Maintainer: tembleking <tembleking at gmail dot com>
pkgname=telegram-history-dump-git
pkgver=r92.5a37d9a
pkgrel=1
pkgdesc='Backup Telegram chat logs using telegram-cli'
arch=('any')
url="https://github.com/tvdstaaij/telegram-history-dump"
license=('GPL')
groups=()
depends=('telegram-cli-git'
         'ruby')
makedepends=('git')
provides=('telegram-history-dump')
source=('git+https://github.com/tvdstaaij/telegram-history-dump.git'
        'telegram-history-dump.sh'
        'telegram-history-dump.patch')

pkgver() {
    cd "$srcdir/telegram-history-dump"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp "telegram-history-dump.patch" "$srcdir/telegram-history-dump/telegram-history-dump.patch"
  cd "$srcdir/telegram-history-dump"
  patch -p1 -i "telegram-history-dump.patch"
  rm -f "telegram-history-dump.patch" 
}

package() {
  install -d "$pkgdir/opt/telegram-history-dump"
  cp -r "$srcdir/telegram-history-dump/." "$pkgdir/opt/telegram-history-dump"

  install -d "$pkgdir/usr/bin"
  install -m0755 "telegram-history-dump.sh" "$pkgdir/usr/bin/telegram-history-dump" 
}


sha512sums=('SKIP'
            '6e7001e1d65038ae93d993e61c369ab69989d33ab841eaf33b377c138f2bcddc129435889231b1b310d3b1b17eed269b072ca783a5715750932bec902f905aa6'
            'f06044b1da5a3c2e5d51f4161b923bc0e95cb896b0ab93bd898d14771d3c1caf5b5c66bf915ac6ae38a85397d52841e4067959dd5e6023df2a20e8c6675492e2')
