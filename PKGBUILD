#! /bin/bash
# Contributor: ascarpino <andrea@archlinux.org>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>

pkgname=kde-servicemenus-youtube
pkgver=1.12a
pkgrel=1
pkgdesc="Konqueror/KDE service menu to download youtube videos"
arch=('any')
url="http://kde-look.org/content/show.php/Get+YouTube+Video+(improved)?content=41456"
license=('GPL')
depends=('kdebase-workspace' 'python2-lxml')
conflicts=('youtube-servicemenu')
replaces=('youtube-servicemenu')
source=("http://kde-look.org/CONTENT/content-files/41456-youtube-servicemenu-${pkgver}.tar.bz2")
sha512sums=('d40fca2a2370cfb59c3ad47e094a0ec5969c34eb9a20fad7c5dbaec189e5cae9139113cdbcb905dd518661b5553ab65e1ee7453790d039c45a067dfd130e71f6')

package() {
  cd youtube-servicemenu-${pkgver}

  sed -i 's/^ServiceTypes=.*/Type=Service\nServiceTypes=KonqPopupMenu\/Plugin,text\/html/' get_yt_video.desktop
  
  sed -i 's/python/python2/' get_yt_video.py

  install -d ${pkgdir}/usr/{bin,share/kde4/services,lib/get_yt_video/}
  install -m755 get_yt_video.py ${pkgdir}/usr/bin/
  install -m644 get_yt_video.desktop ${pkgdir}/usr/share/kde4/services/
  
  find l10n -mindepth 1 -maxdepth 1 -type d -exec cp -r {} ${pkgdir}/usr/lib/get_yt_video/ \;
}

# vim:set ts=2 sw=2 et: