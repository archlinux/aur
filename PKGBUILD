# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=podcasttune-git
pkgver=10.2.1
pkgrel=1
pkgdesc='Web application for listening and discovering podcasts'
arch=('any')
url='https://github.com/Zimniros/PodcastTune'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'meteor')
source=("git+https://github.com/Zimniros/PodcastTune.git"
        "podcasttune.service"
        "podcasttune.tmpfiles"
        "podcasttune.sysusers")
sha512sums=('SKIP'
            '786ec1b7b785c24ddf27b9bc18311bdfc34ec7d87c253c05f0c304ca7c4e042f39ea92af82c1f73001f43e1e8c1e9c83668a293e111e820048dc03b61253d25a'
            '6fa00fbb134fdb107e6042be8d3562e2b675724c03887375a27a9429925cd1add7564d056db977f4248a0329618878c2534f05773369e1b0e0fe4467f595afef'
            'ac7f613d9d725a847c49c50be9488f1312a61443ef88c25a97d3ce8c5ca4a27fb10b6ac1299ed7da51ba11ddb8666071e6ab63eb6c0c007c0b05ec161fd0aa94')
options=(!strip)

build(){
  cd PodcastTune
  meteor npm install --production --cache ../npm-cache
}

package() {
  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -r "${srcdir}/PodcastTune" "${pkgdir}/usr/share/webapps/podcasttune"
  install -Dm 644 "${srcdir}/podcasttune.service" "${pkgdir}/usr/lib/systemd/system/podcasttune.service"
  install -Dm 644 "${srcdir}/podcasttune.sysusers" "${pkgdir}/usr/lib/sysusers.d/podcasttune.conf"
  install -Dm 644 "${srcdir}/podcasttune.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/podcasttune.conf"
}

# vim: ts=2 sw=2 et:
