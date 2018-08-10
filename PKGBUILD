# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-twemoji
pkgver=11.0.1
pkgrel=1
pkgdesc="Twitter Emoji for everyone."
url="https://github.com/twitter/twemoji"
arch=(any)
license=('CCPL' 'MIT' 'Apache')
depends=('fontconfig')
conflicts=('ttf-emoji' 'noto-fonts-emoji' 'ttf-emojione-color' 'ttf-emojione' 'ttf-twemoji-color')
provides=('ttf-emoji')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/t/twitter-twemoji-fonts-${pkgver}-1.fc29.noarch.rpm"
        "70-twemoji-color.conf")
sha256sums=('60e998b75074e9cf53d129106d6de356757176182d83b3fb8a5c1af4e6373607'
            '0a1ba4641cafed31954de7d84f8f362b9f1249ee6f012615a1c239d9b89c938c')

package() {
  install -d "${pkgdir}/etc/fonts/"{conf.d,conf.avail}
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 usr/share/fonts/twemoji/Twemoji.ttf \
    "${pkgdir}/usr/share/fonts/twemoji/twemoji.ttf"
  cp 70-twemoji-color.conf "${pkgdir}/etc/fonts/conf.avail/" 
  ln -s ../conf.avail/70-twemoji-color.conf \
    ${pkgdir}/etc/fonts/conf.d/70-twemoji-color.conf
  cd "usr/share/licenses/twitter-twemoji-fonts"
  cp LICENSE{,-{BUILD,GRAPHICS}} "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
