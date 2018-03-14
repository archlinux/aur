# Maintainer: Jordan Day < jordanday444 at gmail dot com >
# Contributor: Kevin MacMartin <prurigro@gmail.com>

pkgname=exomizer
pkgver=2.0.11
pkgrel=1
pkgdesc='Compresses files in a way that tries to be as efficient as possible but still allows them to be decompressed in environments where CPU speed and RAM are limited'
url='https://bitbucket.org/magli143/exomizer/wiki/Home'
license=('CUSTOM')
arch=('i686' 'x86_64')
depends=('glibc')

source=(
  "https://bitbucket.org/magli143/exomizer/wiki/downloads/$pkgname-$pkgver.zip"
  'LICENSE'
)

sha512sums=(
  #'290952aab8c9b0b566107af96bdb0453ba8c8fc9f3ebc4ff8cad5da1c922d9d1a11d2b34cd111e6a02ff01bc01aa9e9550be163ec65afeabbeadee9857b3e262'
  '44bbea0892b74523bc0fb8bb81c6e6a0021a0455e61ab446ba7fa07a29e35f138b26e8030c59b4f25b45043c4714c01929d586f83b58fb697adf1a7dcb7e776f'
  '89fc74104df3b5dba39d0e31add3486e2c2b2177b4362e822092f5acec70b5bc59ea3713faca1cfeab426748f8ae0e75c2a3c7387a4f6be136014783f7db3a46'
)

prepare() {
  if [[ "$CARCH" = 'x86_64' ]]; then
    sed -i 's|mtune=i686|mtune=generic|' src/Makefile
  fi
}

build() {
  cd src
  make clean
  make
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for txt in exo20info.txt exobasic10b2.txt; do
    install -Dm644 "$txt" "$pkgdir/usr/share/$pkgname/$txt"
  done

  cd src

  for bin in exobasic exomizer; do
    install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
  done
}
