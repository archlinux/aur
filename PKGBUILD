# Maintainer: Yuval Adam <aur@yuv.al>
pkgname=spill-bin
pkgver=0.7.5
pkgrel=1
pkgdesc='BitTorrent client and daemon with a web interface (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/spillrs/spill'
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("spill=$pkgver")
conflicts=('spill')
options=('!strip' '!debug')
backup=('etc/spill/spill.toml')
source=("spill-$pkgver-LICENSE::$url/raw/refs/tags/v$pkgver/LICENSE"
        'spill-system.service' 'spill-user.service' 'spill.sysusers'
        'spill.toml' 'spill-user.toml')
source_x86_64=("$url/releases/download/v$pkgver/spill-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/spill-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'fb1ad0e724ad411a5a1c7e7b9cbda8d0ea125bdcaac6c05aac0083d4c8701ce3'
            '5b65f6a5750a05135483e3d6c07ff0fa2396805c1824b7ce6b27d146b5ab16b1'
            '48eff72045dc86fc4a8ab0e45186aadef232d03a71029e74ac42b272824968e1'
            '89810c573543fc97c8fba68727f28525a112e69b0262b959e2953e98b8904d31'
            '04c011998e62b90637c6ee93fba9d235953cdf36b6a9566aad3773adf8e874c8')
sha256sums_x86_64=('a9a146ee1f41fd584cb824e4d4241de3c834f6ef292fd6cdb4ff95ca7bbb7a49')
sha256sums_aarch64=('235ce117e0b08a388d9d4d88ddc820b4c4ddc88278bb118d2d91251dfaf940db')

package() {
  install -Dm755 spill "$pkgdir/usr/bin/spill"
  install -Dm644 "spill-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/spill-system.service" "$pkgdir/usr/lib/systemd/system/spill.service"
  install -Dm644 "$srcdir/spill-user.service" "$pkgdir/usr/lib/systemd/user/spill.service"
  install -Dm644 "$srcdir/spill.sysusers" "$pkgdir/usr/lib/sysusers.d/spill.conf"
  install -Dm644 "$srcdir/spill.toml" "$pkgdir/etc/spill/spill.toml"
  install -Dm644 "$srcdir/spill-user.toml" "$pkgdir/usr/share/spill/spill-user.toml"
}
