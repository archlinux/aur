pkgname=lightningstream
pkgver=0.5.2
pkgrel=1
pkgdesc='Lightning Stream syncs LMDB databases through S3 buckets between multiple servers, including PowerDNS Authoritative server 4.8+ LMDBs.'
arch=('x86_64' 'aarch64')
url='https://github.com/PowerDNS/lightningstream'
license=('MIT')
makedepends=('git' 'lmdb' 'go')
backup=('etc/lightningstream.yml')
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  "lightningstream.service"
)
sha512sums=('20fa9e003dcb0d5cc6cd6e8b93f03ad843926dd2c2a00b47442a6826bf839142f23fbd836baec94e57f4280a7a74a32fc28f8cb8a300d05f25ec4c78b846525e'
            '4afd7c410f10bf74ce158d0fe7706f5e58e78093dd0fe699857dea938507a783c25a8d0e54cf7f1f18efca216fc0b7c18ef0df3dcec5d2ae91d6eccbea7c7f3c')
b2sums=('cf2f197ea36c02ce0819d449c188376e3be6811b78bb891a97dd7c52b517dd73e6f1f05c407c37dda41eeba24200ac1c1e7f937d883fd40463af5936ae0e95df'
        '017d1aab9d4de6d479a2bbbfcee03404bf3f6ce7f86c7a7523b6305be329b87eccecdb6efd8601e0d335cdf4bc87229c46273c43daba53c16df52a5165356d65')

build() {
  cd $srcdir/$pkgname
  go build -o bin/$pkgname ./cmd/$pkgname
}

package() {
  cd $srcdir/$pkgname
  install -vDm655 bin/$pkgname $pkgdir/usr/bin/$pkgname

  # example config
  install -vDm644 example.yaml $pkgdir/etc/lightningstream.yml

  # service
  install -vDm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service

  # license
  install -vDm644 LICENSE "$pkgname/LICENSE"
}
