# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=emby-server-netcore
pkgver=3.2.36.0
pkgrel=1
pkgdesc='Bring together your videos, music, photos, and live television'
arch=('any')
url='http://emby.media'
license=('GPL2')
depends=('dotnet-runtime-2.0' 'ffmpeg' 'skia-sharp58' 'sqlite')
conflicts=('emby-server')
install='emby-server.install'
source=("https://github.com/MediaBrowser/Emby/releases/download/${pkgver}/embyserver-netcore-${pkgver}.zip"
        'emby-server'
        'emby-migrate-database'
        'emby-server.conf'
        'emby-server.service')
backup=('etc/conf.d/emby-server')
sha256sums=('96ade178f205b7f5c21aedb364aedb932468770493311ef097f39a64a1d59488'
            'f0afca728cf695ae80fffe944ea2700e154293247b30ed592f632c2e58dd00f1'
            'b25bf83a0ab371aff3b13b82f7af71b51bfe6d7e51eb8a8a3dd8f0774ffce6a5'
            '015869b52601a9cdbd303aed9dffe11ef19959da4a070c775ece8416e699979f'
            '8a91ea49a1699c820c4a180710072cba1d6d5c10e45df97477ff6a898f4e1d70')

prepare() {
  rm -rf system/{electron,runtimes}
}

package() {
  install -dm 755 "${pkgdir}"/{etc/conf.d,usr/{bin,lib/systemd/system}}
  cp -dr --no-preserve='ownership' system "${pkgdir}"/usr/lib/emby-server
  install -m 755 emby-server "${pkgdir}"/usr/bin/
  install -m 755 emby-migrate-database "${pkgdir}"/usr/bin/
  install -m 644 emby-server.service "${pkgdir}"/usr/lib/systemd/system/
  install -m 644 emby-server.conf "${pkgdir}"/etc/conf.d/emby-server

  install -dm 755 "${pkgdir}"/var/lib/emby
  chown 422:422 -R "${pkgdir}"/var/lib/emby
}

# vim: ts=2 sw=2 et:
