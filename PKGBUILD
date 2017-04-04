# Maintainer: Nikola Ivačič <nikola.ivacic@dropchop.com>

pkgname=apache-mod_h264_streaming
pkgver=2.2.7
pkgrel=1
pkgdesc="H264 Streaming Module for Apache."
arch=('i686' 'x86_64')
url="http://h264.code-shop.com/trac/wiki/Mod-H264-Streaming-Apache-Version2"
license=('LGPL')
depends=('apache')
makedepends=('apache')
source=("http://h264.code-shop.com/download/apache_mod_h264_streaming-${pkgver}.tar.gz")
md5sums=('123cacef68e9ff56fe908200bd0feea5')

build() {
  cd "$srcdir"/mod_h264_streaming-$pkgver/src
  apxs -L/usr/lib -I/usr/include -DBUILDING_H264_STREAMING -c mod_h264_streaming.c moov.c mp4_io.c mp4_reader.c mp4_writer.c mp4_process.c output_bucket.c output_mp4.c
}

package() {
  cd "$srcdir"/mod_h264_streaming-$pkgver/src
  install -Dm0755 .libs/mod_h264_streaming.so $pkgdir/usr/lib/httpd/modules/mod_h264_streaming.so
}
