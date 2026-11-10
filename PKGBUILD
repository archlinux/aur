# Maintainer: tee < teeaur at duck dot com >

pkgname=rustunnel-bin
pkgver=0.8.9
pkgrel=1
pkgdesc='Self-hosted, secure tunnel server in Rust'
arch=(x86_64)
url='https://rustunnel.com'
license=(AGPL-3.0-or-later)
depends=(glibc libgcc)
provides=(rustunnel)
conflicts=(rustunnel)
_src='https://github.com/joaoh82/rustunnel'
source_x86_64=("$_src/releases/download/v$pkgver/rustunnel-v$pkgver-$arch-unknown-linux-gnu.tar.gz"
  "rustunnel-server-$pkgver::$_src/releases/download/v$pkgver/rustunnel-server-linux-$arch")
source=("$_src/releases/download/v$pkgver/rustunnel-v$pkgver-$arch-unknown-linux-gnu.tar.gz.sha256"
  "rustunnel-server-$pkgver.sha256::$_src/releases/download/v$pkgver/rustunnel-server-linux-$arch.sha256"
  "$_src/raw/v$pkgver/LICENSE"
  "$_src/raw/v$pkgver/deploy/server.toml"
  "$_src/raw/v$pkgver/deploy/rustunnel.service")
b2sums=('eb745fa79a6f42cc52a6596514665383a292d4c635ce49cedaf2e23bf5f94c1a03750a7e3ce537303f1dc5c9ba7da3964976b636411fa75938f4133b12f70e5b'
        '271fe025000f9689d8d6762e372f3e03044b3db239de6b064a0ad6ea214b8e273b710b881620c775d58915dda7146a64d8baefec48a76121d8a452aaaa6814dd'
        '6e6a9da9488406d5780cbf0952fde9f58dca76c394587b33b6d5eaa390c918b18b1aade7482bf4eb40f26235d56d509c81fe8a373819df5cedd001c338508ae0'
        'fcf6d5b9516ae6d66963f40d4758e7881c6390cebff276310f065db654cc070d7bff2aec214ee2e261703441e006dfa73cd79495e6db89c2c16e4227a829f7ac'
        '9b633d7fec46f2356de4c5d8d0f46cea983ea55fc8f6bbb3b106625d50db6bd8d264a821673e1114b07770b3ac07bdcae9d5a3f04d8e968795d3cab2f6eb33f0')
b2sums_x86_64=('224d23a691aa55572de2cadfb106df2b1f86cd6b7691281962e81b2ba4346a48f4917a0c7f0a5c159f91e138b63bd00aa7eec96b28b81fe6cb4b37187eb3561b'
               '60bedc5640942fd11c5b624e89bc9245dde850503fb93e133d4cc1f5aff6bccbf7477c9498b29c844244353179c0921450a39d8d5c64cfc2cff02dac87dbcf61')

package() {
  sed -i "s|/local||" rustunnel.service
  install -Dm644 server.toml -t "$pkgdir/etc/rustunnel/"
  install -Dm644 rustunnel.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm755 rustunnel rustunnel-mcp -t "$pkgdir/usr/bin/"
  install -Dm755 rustunnel-server-$pkgver "$pkgdir/usr/bin/rustunnel-server"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
